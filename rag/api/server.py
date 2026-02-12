"""
server.py

FastAPI service for the DIGIT Flow Builder config generation pipeline.

Usage:
    uvicorn rag.api.server:app --host 0.0.0.0 --port 8000
"""

import json
import logging
import sys
from pathlib import Path

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(name)s] %(message)s",
    datefmt="%H:%M:%S",
)

from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from pydantic import BaseModel

# Load .env from rag/ directory
load_dotenv(Path(__file__).resolve().parent.parent / ".env")

# Add rag/ to path so pipeline imports work
sys.path.insert(0, str(Path(__file__).resolve().parent.parent))

from pipeline.manifest import RegistryManifest
from pipeline.validator import validate_full
from pipeline.graph import run_pipeline

# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

RAG_DIR = Path(__file__).resolve().parent.parent
REPO_ROOT = RAG_DIR.parent
MANIFEST_PATH = RAG_DIR / "registry_manifest.json"
STORE_DIR = RAG_DIR / "indexing" / "stores"
STRICT_SCHEMA_PATH = RAG_DIR / "flow-config-schema-strict.json"

# ---------------------------------------------------------------------------
# App
# ---------------------------------------------------------------------------

app = FastAPI(
    title="DIGIT Flow Builder Config Generator",
    description="Agentic Hybrid RAG for generating valid Flow Builder JSON configs",
    version="1.0.0",
)


# ---------------------------------------------------------------------------
# Request/Response models
# ---------------------------------------------------------------------------

class GenerateRequest(BaseModel):
    prompt: str
    answers: list[str] = []
    model: str = "llama3.1:8b"


class GenerateResponse(BaseModel):
    config: dict | None = None
    is_valid: bool = False
    errors: list[str] = []
    warnings: list[str] = []
    needs_input: bool = False
    questions: list[str] = []


class ValidateRequest(BaseModel):
    config: dict


class ValidateResponse(BaseModel):
    is_valid: bool
    errors: list[str] = []


class RegistryResponse(BaseModel):
    widget_formats: list[str]
    custom_components: list[str]
    action_types: list[str]
    form_formats: list[str]
    form_types: list[str]
    entity_models: list[str]
    transformer_configs: list[str]


class RebuildResponse(BaseModel):
    status: str
    counts: dict


# ---------------------------------------------------------------------------
# Endpoints
# ---------------------------------------------------------------------------

UI_PATH = Path(__file__).resolve().parent / "index.html"


@app.get("/", response_class=HTMLResponse)
async def root():
    """Serve the web UI."""
    return UI_PATH.read_text()


@app.post("/generate-config", response_model=GenerateResponse)
async def generate_config(request: GenerateRequest):
    """Generate a Flow Builder config from a natural language prompt."""
    if not STORE_DIR.exists():
        raise HTTPException(
            status_code=503,
            detail=(
                "Index not built yet. Run: "
                "python rag/indexing/build_index.py"
            ),
        )

    try:
        result = run_pipeline(
            user_query=request.prompt,
            manifest_path=str(MANIFEST_PATH),
            store_dir=str(STORE_DIR),
            strict_schema_path=str(STRICT_SCHEMA_PATH),
            model_name=request.model,
            user_answers=request.answers or None,
        )
        return GenerateResponse(**result)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/validate-config", response_model=ValidateResponse)
async def validate_config(request: ValidateRequest):
    """Validate an existing Flow Builder config."""
    if not MANIFEST_PATH.exists():
        raise HTTPException(
            status_code=503,
            detail=(
                "Manifest not generated yet. Run: "
                "python rag/registry_introspector.py --root . --output rag/registry_manifest.json"
            ),
        )

    manifest = RegistryManifest(str(MANIFEST_PATH))
    is_valid, errors = validate_full(
        request.config, manifest, str(STRICT_SCHEMA_PATH)
    )
    return ValidateResponse(is_valid=is_valid, errors=errors)


@app.get("/registry", response_model=RegistryResponse)
async def get_registry():
    """Return all registered values from the manifest."""
    if not MANIFEST_PATH.exists():
        raise HTTPException(
            status_code=503,
            detail="Manifest not generated yet.",
        )

    manifest = RegistryManifest(str(MANIFEST_PATH))
    return RegistryResponse(
        widget_formats=sorted(manifest.widget_formats),
        custom_components=sorted(manifest.custom_components),
        action_types=sorted(manifest.action_types),
        form_formats=sorted(manifest.form_formats),
        form_types=sorted(manifest.form_types),
        entity_models=sorted(manifest.entity_models),
        transformer_configs=sorted(manifest.transformer_configs),
    )


@app.post("/rebuild-index", response_model=RebuildResponse)
async def rebuild_index():
    """Re-run introspector, schema generator, and index builder."""
    import subprocess

    try:
        # Step 1: Registry introspector
        subprocess.run(
            [
                sys.executable,
                str(RAG_DIR / "registry_introspector.py"),
                "--root", str(REPO_ROOT),
                "--output", str(MANIFEST_PATH),
            ],
            check=True,
            capture_output=True,
            text=True,
        )

        # Step 2: Schema generator
        subprocess.run(
            [
                sys.executable,
                str(RAG_DIR / "schema_generator.py"),
                "--manifest", str(MANIFEST_PATH),
                "--base-schema",
                str(REPO_ROOT / "packages" / "digit_flow_builder" / "flow-config-schema.json"),
                "--output", str(STRICT_SCHEMA_PATH),
            ],
            check=True,
            capture_output=True,
            text=True,
        )

        # Step 3: Index builder
        subprocess.run(
            [
                sys.executable,
                str(RAG_DIR / "indexing" / "build_index.py"),
                "--root", str(REPO_ROOT),
                "--manifest", str(MANIFEST_PATH),
                "--store-dir", str(STORE_DIR),
            ],
            check=True,
            capture_output=True,
            text=True,
        )

        # Load manifest for counts
        manifest = RegistryManifest(str(MANIFEST_PATH))
        return RebuildResponse(
            status="ok",
            counts=manifest.summary(),
        )

    except subprocess.CalledProcessError as e:
        raise HTTPException(
            status_code=500,
            detail=f"Rebuild failed: {e.stderr}",
        )


@app.get("/health")
async def health():
    """Health check."""
    has_manifest = MANIFEST_PATH.exists()
    has_index = (STORE_DIR / "faiss_index").exists()
    return {
        "status": "ok",
        "manifest_loaded": has_manifest,
        "index_built": has_index,
    }
