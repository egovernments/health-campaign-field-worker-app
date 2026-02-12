# RAG System — Local Model Setup

## Status: Code updated — waiting for Ollama install

## What's Done
- [x] Full RAG pipeline built (all 16 files)
- [x] Registry introspector works (26 widgets, 12 actions, 15 form formats, 42 entities)
- [x] Schema generator works (strict schema with enums)
- [x] Chunker works (132 documents)
- [x] 38 tests passing
- [x] FastAPI server + Web UI ready
- [x] Code switched from OpenAI → local models (Ollama + HuggingFace)
- [x] Python packages installed (sentence-transformers, langchain-ollama)

## What's Left

### Step 1: Install Ollama (you do this)
```bash
curl -fsSL https://ollama.com/install.sh | sudo sh
```

### Step 2: Pull a model
```bash
ollama pull llama3.1:8b
```

### Step 3: Build indexes
```bash
cd ~/health-campaign-field-worker-app/rag
python3 indexing/build_index.py --root .. --manifest registry_manifest.json --store-dir indexing/stores
```

### Step 4: Start server
```bash
cd ~/health-campaign-field-worker-app/rag
python3 -m uvicorn api.server:app --host 0.0.0.0 --port 8000
```

### Step 5: Open UI and test
Go to http://localhost:8000

## Model Configuration
| Component | Model | Cost |
|---|---|---|
| Embeddings | HuggingFace `all-MiniLM-L6-v2` (local) | FREE |
| LLM | Ollama `llama3.1:8b` (local) | FREE |

## Files Changed (OpenAI → Local)
1. `rag/requirements.txt` — removed `langchain-openai`, added `langchain-ollama`, `sentence-transformers`, `torch`
2. `rag/indexing/build_index.py` — `OpenAIEmbeddings` → `HuggingFaceEmbeddings`
3. `rag/pipeline/retriever.py` — `OpenAIEmbeddings` → `HuggingFaceEmbeddings`
4. `rag/pipeline/graph.py` — `ChatOpenAI` → `ChatOllama`
5. `rag/pipeline/router.py` — Added JSON fallback for local model compatibility
6. `rag/api/server.py` — Default model changed to `llama3.1:8b`
7. `rag/api/index.html` — Model dropdown: Llama 3.1, Mistral, Qwen options
8. `rag/.env` — Removed OpenAI API key
