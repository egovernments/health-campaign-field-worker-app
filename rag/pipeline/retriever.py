"""
retriever.py

Hybrid BM25 + FAISS retriever with metadata filtering and RAG Fusion.
"""

import pickle
from pathlib import Path

from langchain_core.documents import Document
from langchain_core.language_models import BaseChatModel
from langchain_community.vectorstores import FAISS
from langchain_community.retrievers import BM25Retriever
from langchain_community.embeddings import HuggingFaceEmbeddings


class HybridRetriever:
    """Ensemble retriever combining BM25 keyword search with FAISS vector search.

    Uses weighted reciprocal rank fusion to merge results from both retrievers.
    Higher BM25 weight because config generation is keyword-sensitive
    (exact format/action names matter more than semantic similarity).
    """

    def __init__(self, vector_retriever, bm25_retriever, vector_weight=0.4, bm25_weight=0.6):
        self.vector_retriever = vector_retriever
        self.bm25_retriever = bm25_retriever
        self.vector_weight = vector_weight
        self.bm25_weight = bm25_weight

    def invoke(self, query: str) -> list[Document]:
        """Retrieve and merge results from both retrievers."""
        vector_docs = self.vector_retriever.invoke(query)
        bm25_docs = self.bm25_retriever.invoke(query)

        # Weighted reciprocal rank fusion
        scores: dict[int, dict] = {}
        for rank, doc in enumerate(vector_docs):
            doc_id = hash(doc.page_content)
            if doc_id not in scores:
                scores[doc_id] = {"doc": doc, "score": 0.0}
            scores[doc_id]["score"] += self.vector_weight / (rank + 1)

        for rank, doc in enumerate(bm25_docs):
            doc_id = hash(doc.page_content)
            if doc_id not in scores:
                scores[doc_id] = {"doc": doc, "score": 0.0}
            scores[doc_id]["score"] += self.bm25_weight / (rank + 1)

        ranked = sorted(scores.values(), key=lambda x: x["score"], reverse=True)
        return [item["doc"] for item in ranked]


def load_retriever(
    store_dir: str | Path,
    embedding_model: str = "all-MiniLM-L6-v2",
    bm25_weight: float = 0.6,
    vector_weight: float = 0.4,
    k: int = 8,
) -> HybridRetriever:
    """Load persisted indexes and create a hybrid retriever.

    Args:
        store_dir: Path to the index store directory.
        embedding_model: HuggingFace embedding model name.
        bm25_weight: Weight for BM25 retriever (keyword matching).
        vector_weight: Weight for vector retriever (semantic similarity).
        k: Number of documents to retrieve per retriever.
    """
    store_path = Path(store_dir)

    # Load FAISS vector store
    embeddings = HuggingFaceEmbeddings(model_name=embedding_model)
    vectorstore = FAISS.load_local(
        str(store_path / "faiss_index"),
        embeddings,
        allow_dangerous_deserialization=True,
    )
    vector_retriever = vectorstore.as_retriever(
        search_type="mmr",
        search_kwargs={"k": k, "fetch_k": k * 3},
    )

    # Load BM25 retriever
    with open(store_path / "bm25_retriever.pkl", "rb") as f:
        bm25_retriever: BM25Retriever = pickle.load(f)
    bm25_retriever.k = k

    return HybridRetriever(
        vector_retriever=vector_retriever,
        bm25_retriever=bm25_retriever,
        vector_weight=vector_weight,
        bm25_weight=bm25_weight,
    )


def retrieve_with_filter(
    retriever: HybridRetriever,
    query: str,
    screen_type: str | None = None,
) -> list[Document]:
    """Retrieve documents, optionally post-filtering by screen_type metadata."""
    docs = retriever.invoke(query)

    if screen_type and screen_type != "FULL_FLOW":
        # Post-filter: keep docs matching the screen_type or non-screen docs
        filtered = []
        for doc in docs:
            doc_type = doc.metadata.get("screen_type")
            if doc_type is None or doc_type == screen_type or doc_type == "OTHER":
                filtered.append(doc)
        # If filtering removed too many docs, fall back to unfiltered
        if len(filtered) >= 3:
            return filtered

    return docs


# ---------------------------------------------------------------------------
# RAG Fusion: multi-query expansion + reciprocal rank fusion
# ---------------------------------------------------------------------------

def expand_query(llm: BaseChatModel, user_query: str) -> list[str]:
    """Generate 3 sub-queries for RAG Fusion."""
    prompt = f"""Given this request for a DIGIT Flow Builder config:
"{user_query}"

Generate 3 focused search queries to find relevant config patterns:
1. One focused on the SCREEN TYPE and LAYOUT (widgets needed)
2. One focused on DATA and ACTIONS (entities, search, create)
3. One focused on NAVIGATION and WORKFLOW (screen transitions)

Output one query per line, no numbering or bullets."""

    result = llm.invoke(prompt)
    lines = [
        line.strip()
        for line in result.content.strip().split("\n")
        if line.strip()
    ]
    return lines[:3]


def reciprocal_rank_fusion(
    results: list[list[Document]], k: int = 60
) -> list[Document]:
    """Merge multiple ranked lists using Reciprocal Rank Fusion."""
    fused_scores: dict[int, dict] = {}

    for docs in results:
        for rank, doc in enumerate(docs):
            doc_id = hash(doc.page_content)
            if doc_id not in fused_scores:
                fused_scores[doc_id] = {"doc": doc, "score": 0.0}
            fused_scores[doc_id]["score"] += 1.0 / (rank + k)

    ranked = sorted(
        fused_scores.values(), key=lambda x: x["score"], reverse=True
    )
    return [item["doc"] for item in ranked]


def retrieve_with_fusion(
    retriever: HybridRetriever,
    llm: BaseChatModel,
    user_query: str,
    screen_type: str | None = None,
    max_docs: int = 10,
) -> list[Document]:
    """Multi-query retrieval with reciprocal rank fusion."""
    sub_queries = expand_query(llm, user_query)

    all_results = []
    for query in [user_query] + sub_queries:
        docs = retrieve_with_filter(retriever, query, screen_type)
        all_results.append(docs)

    fused = reciprocal_rank_fusion(all_results)
    return fused[:max_docs]
