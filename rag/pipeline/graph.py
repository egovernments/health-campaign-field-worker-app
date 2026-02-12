"""
graph.py

LangGraph state machine that orchestrates the full RAG pipeline:
  route_query → [complete?] → gather_info ↔ route_query (max 3 rounds)
  → retrieve → compress → generate → validate → [valid?] → END
                                                  ↓ (invalid)
                                          corrective_rewrite → validate (max 3 retries)
"""

import json
import logging
import time
from typing import TypedDict, Optional
from pathlib import Path

logger = logging.getLogger("rag.pipeline")
logger.setLevel(logging.INFO)

from langchain_core.language_models import BaseChatModel
from langchain_ollama import ChatOllama
from langgraph.graph import StateGraph, START, END

from .manifest import RegistryManifest
from .router import create_router
from .retriever import load_retriever, retrieve_with_filter, retrieve_with_fusion
from .compressor import compress_documents, group_context_by_type
from .prompts import (
    build_template_prompt,
    build_form_prompt,
    build_full_flow_prompt,
    GATHER_INFO_PROMPT,
)
from .validator import validate_full
from .corrector import corrective_rewrite


# ---------------------------------------------------------------------------
# State
# ---------------------------------------------------------------------------

class GraphState(TypedDict):
    user_query: str
    route: Optional[str]                 # TEMPLATE | FORM | FULL_FLOW
    is_complete: bool
    missing_info: list[str]
    follow_up_questions: list[str]
    user_answers: list[str]
    intent_keywords: list[str]
    documents: list[str]
    doc_metadata: list[dict]
    generation: Optional[dict]
    validation_errors: list[str]
    retry_count: int
    gather_rounds: int
    final_output: Optional[dict]
    warnings: list[str]


# ---------------------------------------------------------------------------
# Graph builder
# ---------------------------------------------------------------------------

def build_graph(
    llm: BaseChatModel,
    manifest: RegistryManifest,
    store_dir: str | Path,
    strict_schema_path: str | Path,
    embedding_model: str = "all-MiniLM-L6-v2",
) -> StateGraph:
    """Build and compile the LangGraph workflow."""

    router_fn = create_router(llm)
    retriever = load_retriever(
        store_dir,
        embedding_model=embedding_model,
    )

    # -- Node implementations --

    def route_query(state: GraphState) -> dict:
        logger.info("[1/7] ROUTE_QUERY — Analyzing prompt and determining screen type...")
        t0 = time.time()
        result = router_fn(state["user_query"], state.get("user_answers"))
        logger.info(
            "[1/7] ROUTE_QUERY — Done in %.1fs | route=%s, complete=%s, keywords=%s",
            time.time() - t0, result.screen_type, result.is_complete, result.intent_keywords,
        )
        return {
            "route": result.screen_type,
            "intent_keywords": result.intent_keywords,
            "is_complete": result.is_complete,
            "missing_info": result.missing_info,
        }

    def gather_info(state: GraphState) -> dict:
        round_num = state.get("gather_rounds", 0) + 1
        logger.info("[  ] GATHER_INFO — Round %d/3, generating follow-up questions...", round_num)
        missing = state.get("missing_info", [])
        route = state.get("route", "FULL_FLOW")

        prompt = GATHER_INFO_PROMPT.format(
            route=route,
            missing_items="\n".join(f"- {item}" for item in missing),
        )
        t0 = time.time()
        result = llm.invoke(prompt)
        questions = [
            q.strip()
            for q in result.content.strip().split("\n")
            if q.strip()
        ]
        logger.info("[  ] GATHER_INFO — Done in %.1fs, %d questions generated", time.time() - t0, len(questions))

        return {
            "follow_up_questions": questions,
            "gather_rounds": round_num,
        }

    def retrieve(state: GraphState) -> dict:
        logger.info("[2/7] RETRIEVE — Fetching relevant documents (BM25 + FAISS hybrid)...")
        t0 = time.time()
        query = (
            state["user_query"]
            + " "
            + " ".join(state.get("intent_keywords", []))
        )
        if state.get("user_answers"):
            query += " " + " ".join(state["user_answers"])

        docs = retrieve_with_fusion(
            retriever,
            llm,
            query,
            screen_type=state.get("route"),
            max_docs=10,
        )
        logger.info("[2/7] RETRIEVE — Done in %.1fs, %d documents retrieved", time.time() - t0, len(docs))
        return {
            "documents": [doc.page_content for doc in docs],
            "doc_metadata": [doc.metadata for doc in docs],
        }

    def compress_context(state: GraphState) -> dict:
        from langchain_core.documents import Document

        logger.info("[3/7] COMPRESS — Compressing %d documents...", len(state.get("documents", [])))
        t0 = time.time()
        metadata_list = state.get("doc_metadata", [])
        docs = [
            Document(page_content=content, metadata=metadata_list[i] if i < len(metadata_list) else {})
            for i, content in enumerate(state.get("documents", []))
        ]
        compressed = compress_documents(docs, state["user_query"], llm)
        logger.info("[3/7] COMPRESS — Done in %.1fs, %d → %d documents", time.time() - t0, len(docs), len(compressed))
        return {
            "documents": [doc.page_content for doc in compressed],
            "doc_metadata": [doc.metadata for doc in compressed],
        }

    def generate_config(state: GraphState) -> dict:
        route = state.get("route", "TEMPLATE")
        logger.info("[4/7] GENERATE — Building %s config with LLM...", route)
        t0 = time.time()

        # Group retrieved documents by collection type so prompts get
        # proper schema, exemplar, and widget context instead of a flat dump
        from langchain_core.documents import Document as _Doc
        raw_docs = [
            _Doc(page_content=c, metadata=m)
            for c, m in zip(
                state.get("documents", []),
                state.get("doc_metadata", [{}] * len(state.get("documents", []))),
            )
        ]
        grouped = group_context_by_type(raw_docs)
        schema_ctx = grouped.get("schema", "")
        exemplar_ctx = grouped.get("exemplars", "")
        widget_ctx = grouped.get("widgets", "")

        # If exemplars are empty (metadata missing), fall back to full dump
        if not exemplar_ctx and not widget_ctx:
            all_context = "\n\n---\n\n".join(state.get("documents", []))
            schema_ctx = all_context

        # Build full query from original + user answers
        full_query = state["user_query"]
        if state.get("user_answers"):
            full_query += (
                "\n\nAdditional details:\n"
                + "\n".join(state["user_answers"])
            )

        previous_errors = state.get("validation_errors", [])

        if route == "FORM":
            prompt = build_form_prompt(
                manifest=manifest,
                schema_context=schema_ctx,
                exemplar_context=exemplar_ctx,
                user_query=full_query,
                previous_errors=previous_errors or None,
            )
        elif route == "FULL_FLOW":
            prompt = build_full_flow_prompt(
                manifest=manifest,
                schema_context=schema_ctx,
                exemplar_context=exemplar_ctx,
                widget_context=widget_ctx,
                user_query=full_query,
                previous_errors=previous_errors or None,
            )
        else:
            prompt = build_template_prompt(
                manifest=manifest,
                schema_context=schema_ctx,
                exemplar_context=exemplar_ctx,
                widget_context=widget_ctx,
                user_query=full_query,
                previous_errors=previous_errors or None,
            )

        result = llm.invoke(prompt)
        content = result.content.strip()

        # Strip markdown code fences if present
        if content.startswith("```"):
            lines = content.split("\n")
            lines = [l for l in lines if not l.strip().startswith("```")]
            content = "\n".join(lines)

        try:
            config = json.loads(content)
        except json.JSONDecodeError as e:
            logger.error("[4/7] GENERATE — Failed to parse JSON in %.1fs: %s", time.time() - t0, e)
            return {
                "generation": None,
                "validation_errors": [f"JSON parse error: {e}"],
            }

        logger.info("[4/7] GENERATE — Done in %.1fs, config generated successfully", time.time() - t0)
        return {"generation": config}

    def validate_config(state: GraphState) -> dict:
        logger.info("[5/7] VALIDATE — Running schema + semantic validation...")
        t0 = time.time()
        config = state.get("generation")
        if config is None:
            logger.warning("[5/7] VALIDATE — No config to validate")
            return {
                "validation_errors": state.get(
                    "validation_errors", ["No config generated"]
                ),
                "final_output": None,
            }

        is_valid, errors = validate_full(config, manifest, strict_schema_path)
        if is_valid:
            logger.info("[5/7] VALIDATE — PASSED in %.1fs", time.time() - t0)
            return {
                "validation_errors": [],
                "final_output": config,
            }
        logger.warning("[5/7] VALIDATE — FAILED in %.1fs with %d errors: %s", time.time() - t0, len(errors), errors[:3])
        return {
            "validation_errors": errors,
            "final_output": None,
        }

    def do_corrective_rewrite(state: GraphState) -> dict:
        retry = state.get("retry_count", 0) + 1
        logger.info("[6/7] CORRECTIVE_REWRITE — Attempt %d/3, fixing %d errors...", retry, len(state.get("validation_errors", [])))
        t0 = time.time()
        config = state.get("generation", {})
        errors = state.get("validation_errors", [])

        try:
            corrected = corrective_rewrite(config, errors, manifest, llm)
        except (json.JSONDecodeError, Exception) as e:
            logger.error("[6/7] CORRECTIVE_REWRITE — Failed in %.1fs: %s", time.time() - t0, e)
            return {
                "generation": config,
                "retry_count": retry,
                "validation_errors": errors + [f"Correction failed: {e}"],
            }

        logger.info("[6/7] CORRECTIVE_REWRITE — Done in %.1fs", time.time() - t0)
        return {
            "generation": corrected,
            "retry_count": retry,
        }

    # -- Conditional edges --

    def decide_completeness(state: GraphState) -> str:
        if state.get("is_complete", False):
            return "complete"
        if state.get("gather_rounds", 0) >= 3:
            return "complete"  # Force proceed after 3 rounds
        return "incomplete"

    def decide_validation(state: GraphState) -> str:
        if not state.get("validation_errors"):
            return "valid"
        if state.get("retry_count", 0) >= 3:
            return "exhausted"
        return "retry"

    # -- Build graph --

    workflow = StateGraph(GraphState)

    workflow.add_node("route_query", route_query)
    workflow.add_node("gather_info", gather_info)
    workflow.add_node("retrieve", retrieve)
    workflow.add_node("compress_context", compress_context)
    workflow.add_node("generate_config", generate_config)
    workflow.add_node("validate_config", validate_config)
    workflow.add_node("corrective_rewrite", do_corrective_rewrite)

    # Edges
    workflow.add_edge(START, "route_query")

    workflow.add_conditional_edges(
        "route_query",
        decide_completeness,
        {
            "complete": "retrieve",
            "incomplete": "gather_info",
        },
    )
    workflow.add_edge("gather_info", "route_query")

    workflow.add_edge("retrieve", "compress_context")
    workflow.add_edge("compress_context", "generate_config")
    workflow.add_edge("generate_config", "validate_config")

    workflow.add_conditional_edges(
        "validate_config",
        decide_validation,
        {
            "valid": END,
            "retry": "corrective_rewrite",
            "exhausted": END,
        },
    )
    # Corrective rewrite goes to validate (NOT generate) to avoid undoing fixes
    workflow.add_edge("corrective_rewrite", "validate_config")

    return workflow.compile()


# ---------------------------------------------------------------------------
# Convenience runner
# ---------------------------------------------------------------------------

def run_pipeline(
    user_query: str,
    manifest_path: str | Path = "rag/registry_manifest.json",
    store_dir: str | Path = "rag/indexing/stores",
    strict_schema_path: str | Path = "rag/flow-config-schema-strict.json",
    model_name: str = "llama3.1:8b",
    user_answers: list[str] | None = None,
) -> dict:
    """Run the full pipeline and return the result.

    Returns:
        Dict with keys: config, is_valid, errors, warnings
    """
    logger.info("=" * 60)
    logger.info("PIPELINE START | model=%s | query='%s'", model_name, user_query[:80])
    logger.info("=" * 60)
    pipeline_t0 = time.time()
    llm = ChatOllama(model=model_name, temperature=0)
    manifest = RegistryManifest(manifest_path)

    graph = build_graph(
        llm=llm,
        manifest=manifest,
        store_dir=store_dir,
        strict_schema_path=strict_schema_path,
    )

    initial_state: GraphState = {
        "user_query": user_query,
        "route": None,
        "is_complete": False,
        "missing_info": [],
        "follow_up_questions": [],
        "user_answers": user_answers or [],
        "intent_keywords": [],
        "documents": [],
        "doc_metadata": [],
        "generation": None,
        "validation_errors": [],
        "retry_count": 0,
        "gather_rounds": 0,
        "final_output": None,
        "warnings": [],
    }

    result = graph.invoke(initial_state)
    logger.info("=" * 60)
    logger.info("PIPELINE COMPLETE | Total time: %.1fs", time.time() - pipeline_t0)
    logger.info("=" * 60)

    # Determine final output
    config = result.get("final_output") or result.get("generation")
    errors = result.get("validation_errors", [])
    is_valid = not errors
    warnings = []

    if result.get("follow_up_questions") and not result.get("is_complete"):
        return {
            "config": None,
            "is_valid": False,
            "errors": [],
            "warnings": [],
            "needs_input": True,
            "questions": result["follow_up_questions"],
        }

    if errors and config:
        warnings = [
            "Config generated with validation warnings after max retries:"
        ] + errors

    return {
        "config": config,
        "is_valid": is_valid,
        "errors": errors if not config else [],
        "warnings": warnings,
        "needs_input": False,
        "questions": [],
    }
