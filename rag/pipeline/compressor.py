"""
compressor.py

Context compression — extracts only the relevant sections from retrieved documents.
Uses a direct LLM call instead of LLMChainExtractor (removed in LangChain v1.x).
"""

from langchain_core.documents import Document
from langchain_core.language_models import BaseChatModel


COMPRESSION_PROMPT = """Given the following document and a user query, extract ONLY the parts of the document that are directly relevant to the query. If the document is not relevant at all, respond with "NOT_RELEVANT".

Query: {query}

Document:
{document}

Extracted relevant content:"""


def compress_documents(
    documents: list[Document],
    query: str,
    llm: BaseChatModel,
) -> list[Document]:
    """Compress retrieved documents to extract only relevant sections.

    Small documents (< 500 chars) are kept as-is.
    Large documents are passed through the LLM to extract relevant parts.
    """
    compressed = []

    for doc in documents:
        # Skip compression for small documents
        if len(doc.page_content) < 500:
            compressed.append(doc)
            continue

        try:
            prompt = COMPRESSION_PROMPT.format(
                query=query,
                document=doc.page_content[:3000],  # Cap input to avoid token limits
            )
            result = llm.invoke(prompt)
            content = result.content.strip()

            if content and content != "NOT_RELEVANT":
                compressed.append(
                    Document(
                        page_content=content,
                        metadata=doc.metadata,
                    )
                )
        except Exception:
            # If compression fails, keep the original document
            compressed.append(doc)

    return compressed


def group_context_by_type(documents: list[Document]) -> dict[str, str]:
    """Group compressed documents by collection type for prompt injection."""
    groups: dict[str, list[str]] = {
        "schema": [],
        "exemplars": [],
        "widgets": [],
        "transformers": [],
        "wrappers": [],
    }

    collection_map = {
        "schema_reference": "schema",
        "sample_configs": "exemplars",
        "widget_reference": "widgets",
        "transformer_patterns": "transformers",
        "wrapper_patterns": "wrappers",
    }

    for doc in documents:
        collection = doc.metadata.get("collection", "")
        group_key = collection_map.get(collection, "schema")
        groups[group_key].append(doc.page_content)

    return {k: "\n\n---\n\n".join(v) if v else "" for k, v in groups.items()}
