"""
build_index.py

Builds dual indexes (FAISS vector + BM25 keyword) from chunked documents.
Persists both to rag/indexing/stores/.

Usage:
    python rag/indexing/build_index.py \
        --manifest rag/registry_manifest.json \
        --store-dir rag/indexing/stores
"""

import json
import pickle
import argparse
from pathlib import Path

from dotenv import load_dotenv
load_dotenv(Path(__file__).resolve().parent.parent / ".env")

from langchain_core.documents import Document
from langchain_community.vectorstores import FAISS
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.retrievers import BM25Retriever

from chunker import chunk_all


def build_documents(chunks: list[dict]) -> list[Document]:
    """Convert raw chunk dicts into LangChain Documents."""
    documents = []
    for i, chunk in enumerate(chunks):
        doc = Document(
            page_content=chunk["content"],
            metadata={**chunk["metadata"], "chunk_id": i},
        )
        documents.append(doc)
    return documents


def build_faiss_index(
    documents: list[Document],
    store_dir: Path,
    embedding_model: str = "all-MiniLM-L6-v2",
) -> FAISS:
    """Build and persist a FAISS vector index."""
    embeddings = HuggingFaceEmbeddings(model_name=embedding_model)
    vectorstore = FAISS.from_documents(documents, embeddings)
    vectorstore.save_local(str(store_dir / "faiss_index"))
    return vectorstore


def build_bm25_index(
    documents: list[Document],
    store_dir: Path,
) -> BM25Retriever:
    """Build and persist a BM25 keyword index."""
    retriever = BM25Retriever.from_documents(documents, k=8)
    with open(store_dir / "bm25_retriever.pkl", "wb") as f:
        pickle.dump(retriever, f)
    return retriever


def build_all(
    repo_root: Path,
    manifest_path: Path | None,
    store_dir: Path,
    embedding_model: str = "all-MiniLM-L6-v2",
) -> dict:
    """Build all indexes and return summary."""
    manifest = None
    if manifest_path and manifest_path.exists():
        with open(manifest_path) as f:
            manifest = json.load(f)

    # Chunk all documents
    chunks = chunk_all(repo_root, manifest)
    documents = build_documents(chunks)

    # Create store directory
    store_dir.mkdir(parents=True, exist_ok=True)

    # Build indexes
    print(f"Building FAISS index from {len(documents)} documents...")
    vectorstore = build_faiss_index(documents, store_dir, embedding_model)

    print(f"Building BM25 index from {len(documents)} documents...")
    bm25_retriever = build_bm25_index(documents, store_dir)

    # Save document metadata for reference
    metadata_list = [
        {
            "chunk_id": doc.metadata.get("chunk_id"),
            "collection": doc.metadata.get("collection"),
            "source": doc.metadata.get("source"),
            "screen_name": doc.metadata.get("screen_name"),
            "screen_type": doc.metadata.get("screen_type"),
            "format": doc.metadata.get("format"),
        }
        for doc in documents
    ]
    with open(store_dir / "document_metadata.json", "w") as f:
        json.dump(metadata_list, f, indent=2)

    # Summary by collection
    collections: dict[str, int] = {}
    for doc in documents:
        col = doc.metadata.get("collection", "unknown")
        collections[col] = collections.get(col, 0) + 1

    return {
        "total_documents": len(documents),
        "collections": collections,
        "store_dir": str(store_dir),
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build FAISS and BM25 indexes"
    )
    parser.add_argument(
        "--root",
        default=str(Path(__file__).resolve().parent.parent.parent),
        help="Repo root",
    )
    parser.add_argument(
        "--manifest",
        default="rag/registry_manifest.json",
        help="Path to registry_manifest.json",
    )
    parser.add_argument(
        "--store-dir",
        default="rag/indexing/stores",
        help="Directory to persist indexes",
    )
    parser.add_argument(
        "--embedding-model",
        default="all-MiniLM-L6-v2",
        help="HuggingFace embedding model name",
    )
    args = parser.parse_args()

    summary = build_all(
        repo_root=Path(args.root),
        manifest_path=Path(args.manifest),
        store_dir=Path(args.store_dir),
        embedding_model=args.embedding_model,
    )

    print(f"\nIndex build complete:")
    print(f"  Total documents: {summary['total_documents']}")
    for col, count in sorted(summary["collections"].items()):
        print(f"    {col}: {count}")
    print(f"  Store directory: {summary['store_dir']}")
