"""
chunker.py

Chunks four document collections for the RAG pipeline:
  1. Config Schema Reference (strict schema + documentation)
  2. Existing Page Configs (per-screen exemplars from sample configs)
  3. Widget Reference (per-widget implementation details)
  4. Transformer & Wrapper Patterns

Each chunk is returned as a dict with 'content' and 'metadata' keys,
ready to be converted to LangChain Documents in build_index.py.
"""

import json
import re
from pathlib import Path

from langchain_text_splitters import RecursiveCharacterTextSplitter


REPO_ROOT = Path(__file__).resolve().parent.parent.parent


# ---------------------------------------------------------------------------
# Collection 1: Config Schema Reference
# ---------------------------------------------------------------------------

def chunk_schema_reference(repo_root: Path | None = None) -> list[dict]:
    """Chunk the strict schema (single doc) and config documentation (by section)."""
    root = repo_root or REPO_ROOT
    chunks = []

    # 1a. Strict schema as a single document
    strict_schema_path = root / "rag" / "flow-config-schema-strict.json"
    if strict_schema_path.exists():
        chunks.append({
            "content": strict_schema_path.read_text(),
            "metadata": {
                "source": "flow-config-schema-strict.json",
                "collection": "schema_reference",
                "doc_type": "json_schema",
            },
        })

    # 1b. Config documentation split by section
    doc_path = root / "DIGIT_FLOW_BUILDER_CONFIG_DOCUMENTATION.md"
    if doc_path.exists():
        splitter = RecursiveCharacterTextSplitter(
            chunk_size=1000,
            chunk_overlap=200,
            separators=["\n## ", "\n### ", "\n---", "\n\n", "\n"],
        )
        doc_text = doc_path.read_text()
        splits = splitter.split_text(doc_text)
        for i, chunk_text in enumerate(splits):
            chunks.append({
                "content": chunk_text,
                "metadata": {
                    "source": "DIGIT_FLOW_BUILDER_CONFIG_DOCUMENTATION.md",
                    "collection": "schema_reference",
                    "doc_type": "config_guide",
                    "chunk_index": i,
                },
            })

    return chunks


# ---------------------------------------------------------------------------
# Collection 2: Existing Page Configs (per-screen exemplars)
# ---------------------------------------------------------------------------

def _parse_dart_config(file_path: Path) -> dict | None:
    """Parse a Dart file containing a config map literal.

    Dart config files look like:
        final dynamic varName = { "name": "...", "flows": [...] };
    The body is valid JSON (double-quoted strings, standard literals).
    """
    text = file_path.read_text()

    # Strip the Dart variable declaration to get the JSON body
    # Match: final dynamic varName = { ... };
    # or: const varName = [ ... ];
    # Find the first { or [ after the =
    eq_idx = text.find("=")
    if eq_idx == -1:
        return None

    body_start = eq_idx + 1
    # Skip whitespace
    while body_start < len(text) and text[body_start] in " \t\n\r":
        body_start += 1

    # Find the matching closing brace/bracket
    body = text[body_start:].rstrip().rstrip(";")

    try:
        return json.loads(body)
    except json.JSONDecodeError:
        # Dart map literals may have trailing commas — strip them
        cleaned = _clean_dart_json(body)
        try:
            return json.loads(cleaned)
        except json.JSONDecodeError:
            return None


def _clean_dart_json(text: str) -> str:
    """Remove trailing commas and Dart-specific syntax to make valid JSON."""
    # Remove single-line comments
    text = re.sub(r"//.*$", "", text, flags=re.MULTILINE)
    # Remove trailing commas before } or ]
    text = re.sub(r",\s*([}\]])", r"\1", text)
    return text


def _extract_widget_formats(widget_config: dict | list) -> list[str]:
    """Recursively extract all widget format strings from a config tree."""
    formats = []
    if isinstance(widget_config, dict):
        if "format" in widget_config:
            formats.append(widget_config["format"])
        for v in widget_config.values():
            formats.extend(_extract_widget_formats(v))
    elif isinstance(widget_config, list):
        for item in widget_config:
            formats.extend(_extract_widget_formats(item))
    return formats


def _extract_action_types(config: dict | list) -> list[str]:
    """Recursively extract all actionType strings from a config tree."""
    types = []
    if isinstance(config, dict):
        if "actionType" in config:
            types.append(config["actionType"])
        for v in config.values():
            types.extend(_extract_action_types(v))
    elif isinstance(config, list):
        for item in config:
            types.extend(_extract_action_types(item))
    return types


def _extract_entity_models(config: dict | list) -> list[str]:
    """Extract entity model names from wrapperConfig."""
    models = []
    if isinstance(config, dict):
        wrapper = config.get("wrapperConfig", {})
        if isinstance(wrapper, dict):
            if "rootEntity" in wrapper:
                models.append(wrapper["rootEntity"])
            for rel in wrapper.get("relations", []):
                if "entity" in rel:
                    models.append(rel["entity"])
    return models


def _build_section_summary(screen: dict) -> str:
    """Build a human-readable section placement summary for a screen config.

    This tells the LLM which widgets are in header/body/footer so it can
    learn the patterns from exemplars instead of hardcoded rules.
    """
    lines = []
    screen_name = screen.get("name", "unknown")
    screen_type = screen.get("screenType", "UNKNOWN")
    lines.append(f"=== SECTION PATTERN for '{screen_name}' ({screen_type}) ===")

    for section in ("header", "body", "footer"):
        items = screen.get(section, [])
        if not items:
            lines.append(f"  {section}: [] (empty)")
        else:
            formats = []
            for item in items:
                fmt = item.get("format", "?")
                extra = []
                if "primaryAction" in item:
                    pa_fmt = item["primaryAction"].get("format", "")
                    extra.append(f"primaryAction={pa_fmt}")
                if "secondaryAction" in item:
                    sa_fmt = item["secondaryAction"].get("format", "")
                    extra.append(f"secondaryAction={sa_fmt}")
                if "children" in item:
                    child_fmts = [c.get("format", "?") for c in item.get("children", []) if isinstance(c, dict)]
                    if child_fmts:
                        extra.append(f"children=[{', '.join(child_fmts)}]")
                desc = fmt
                if extra:
                    desc += f" ({', '.join(extra)})"
                formats.append(desc)
            lines.append(f"  {section}: [{', '.join(formats)}]")

    init_actions = screen.get("initActions", [])
    if init_actions:
        action_types = [a.get("actionType", "?") for a in init_actions if isinstance(a, dict)]
        lines.append(f"  initActions: [{', '.join(action_types)}]")
    else:
        lines.append(f"  initActions: [] (empty)")

    has_wrapper = "wrapperConfig" in screen
    lines.append(f"  wrapperConfig: {'yes' if has_wrapper else 'no'}")

    return "\n".join(lines)


def chunk_sample_configs(repo_root: Path | None = None) -> list[dict]:
    """Parse sample config Dart files and extract per-screen chunks."""
    root = repo_root or REPO_ROOT
    config_dir = (
        root / "apps" / "health_campaign_field_worker_app"
        / "lib" / "sampleJsonConfigs"
    )
    chunks = []

    for dart_file in sorted(config_dir.glob("*.dart")):
        config = _parse_dart_config(dart_file)
        if config is None:
            continue

        flows = config.get("flows", [])
        if not flows:
            # File might be a non-flow config (e.g. permission_handler)
            chunks.append({
                "content": json.dumps(config, indent=2),
                "metadata": {
                    "source": dart_file.name,
                    "collection": "sample_configs",
                    "screen_name": config.get("name", dart_file.stem),
                    "screen_type": "OTHER",
                    "has_wrapper": False,
                    "has_init_actions": False,
                    "widget_formats_used": [],
                    "action_types_used": _extract_action_types(config),
                    "entity_models": [],
                },
            })
            continue

        for screen in flows:
            screen_name = screen.get("name", "unknown")
            screen_type = screen.get("screenType", "UNKNOWN")

            header_widgets = sorted(set(
                _extract_widget_formats(screen.get("header", []))
            ))
            body_widgets = sorted(set(
                _extract_widget_formats(screen.get("body", []))
            ))
            footer_widgets = sorted(set(
                _extract_widget_formats(screen.get("footer", []))
            ))
            widget_formats = sorted(set(
                header_widgets + body_widgets + footer_widgets
            ))
            action_types = sorted(set(
                _extract_action_types(screen.get("initActions", []))
                + _extract_action_types(screen.get("onAction", []))
                + _extract_action_types(screen.get("header", []))
                + _extract_action_types(screen.get("body", []))
                + _extract_action_types(screen.get("footer", []))
            ))
            entity_models = sorted(set(_extract_entity_models(screen)))

            # Build section summary and prepend to content
            section_summary = _build_section_summary(screen)
            enriched_content = (
                section_summary + "\n\n"
                + json.dumps(screen, indent=2)
            )

            chunks.append({
                "content": enriched_content,
                "metadata": {
                    "source": dart_file.name,
                    "collection": "sample_configs",
                    "screen_name": screen_name,
                    "screen_type": screen_type,
                    "has_wrapper": "wrapperConfig" in screen,
                    "has_init_actions": bool(screen.get("initActions")),
                    "widget_formats_used": widget_formats,
                    "header_widgets": header_widgets,
                    "body_widgets": body_widgets,
                    "footer_widgets": footer_widgets,
                    "action_types_used": action_types,
                    "entity_models": entity_models,
                },
            })

    return chunks


# ---------------------------------------------------------------------------
# Collection 3: Widget Reference
# ---------------------------------------------------------------------------

def chunk_widget_reference(
    repo_root: Path | None = None,
    manifest: dict | None = None,
) -> list[dict]:
    """Create one chunk per widget implementation file."""
    root = repo_root or REPO_ROOT
    widget_dir = (
        root / "packages" / "digit_flow_builder"
        / "lib" / "widgets" / "implementations"
    )
    chunks = []

    # Load manifest for enriched metadata if available
    manifest_widgets = {}
    if manifest:
        for w in manifest.get("template_widget_formats", {}).get("items", []):
            manifest_widgets[w["format"]] = w

    for dart_file in sorted(widget_dir.glob("*.dart")):
        content = dart_file.read_text()

        # Extract format name
        match = re.search(
            r"String\s+get\s+format\s*=>\s*\n?\s*['\"](\w+)['\"]",
            content,
        )
        if not match:
            continue

        format_name = match.group(1)
        widget_meta = manifest_widgets.get(format_name, {})

        chunks.append({
            "content": content,
            "metadata": {
                "source": dart_file.name,
                "collection": "widget_reference",
                "format": format_name,
                "class_name": widget_meta.get("class", ""),
                "json_properties_read": widget_meta.get(
                    "json_properties_read", []
                ),
                "supports_children": widget_meta.get(
                    "supports_children", False
                ),
                "supports_child": widget_meta.get("supports_child", False),
                "supports_onAction": widget_meta.get(
                    "supports_onAction", False
                ),
            },
        })

    return chunks


# ---------------------------------------------------------------------------
# Collection 4: Transformer & Wrapper Patterns
# ---------------------------------------------------------------------------

def chunk_transformer_configs(repo_root: Path | None = None) -> list[dict]:
    """Chunk transformer config by top-level config name."""
    root = repo_root or REPO_ROOT
    config_path = (
        root / "packages" / "digit_flow_builder"
        / "lib" / "data" / "transformer_config.dart"
    )
    chunks = []

    if not config_path.exists():
        return chunks

    content = config_path.read_text()

    # Parse the Dart map — extract the JSON body
    config = _parse_dart_config(config_path)
    if config is None:
        # If parsing fails, store the whole file as a single chunk
        chunks.append({
            "content": content,
            "metadata": {
                "source": "transformer_config.dart",
                "collection": "transformer_patterns",
                "config_name": "full_file",
            },
        })
        return chunks

    for config_name, config_body in config.items():
        chunks.append({
            "content": json.dumps(
                {config_name: config_body}, indent=2
            ),
            "metadata": {
                "source": "transformer_config.dart",
                "collection": "transformer_patterns",
                "config_name": config_name,
            },
        })

    return chunks


def chunk_wrapper_reference(repo_root: Path | None = None) -> list[dict]:
    """Chunk the wrapper reference documentation by section."""
    root = repo_root or REPO_ROOT
    ref_path = root / "rag" / "indexing" / "wrapper_reference.md"
    chunks = []

    if not ref_path.exists():
        return chunks

    splitter = RecursiveCharacterTextSplitter(
        chunk_size=1200,
        chunk_overlap=200,
        separators=["\n## ", "\n### ", "\n\n", "\n"],
    )
    text = ref_path.read_text()
    splits = splitter.split_text(text)
    for i, chunk_text in enumerate(splits):
        chunks.append({
            "content": chunk_text,
            "metadata": {
                "source": "wrapper_reference.md",
                "collection": "wrapper_reference",
                "doc_type": "wrapper_guide",
                "chunk_index": i,
            },
        })

    return chunks


def chunk_wrapper_patterns(repo_root: Path | None = None) -> list[dict]:
    """Extract wrapperConfig objects from sample configs as separate chunks."""
    root = repo_root or REPO_ROOT
    config_dir = (
        root / "apps" / "health_campaign_field_worker_app"
        / "lib" / "sampleJsonConfigs"
    )
    chunks = []

    for dart_file in sorted(config_dir.glob("*.dart")):
        config = _parse_dart_config(dart_file)
        if config is None:
            continue

        for screen in config.get("flows", []):
            wrapper = screen.get("wrapperConfig")
            if wrapper:
                chunks.append({
                    "content": json.dumps(wrapper, indent=2),
                    "metadata": {
                        "source": dart_file.name,
                        "collection": "wrapper_patterns",
                        "screen_name": screen.get("name", "unknown"),
                        "wrapper_name": wrapper.get(
                            "wrapperName", "unknown"
                        ),
                        "root_entity": wrapper.get("rootEntity", ""),
                    },
                })

    return chunks


# ---------------------------------------------------------------------------
# Aggregate
# ---------------------------------------------------------------------------

def chunk_all(
    repo_root: Path | None = None,
    manifest: dict | None = None,
) -> list[dict]:
    """Chunk all four collections and return combined list."""
    root = repo_root or REPO_ROOT

    all_chunks = []
    all_chunks.extend(chunk_schema_reference(root))
    all_chunks.extend(chunk_sample_configs(root))
    all_chunks.extend(chunk_widget_reference(root, manifest))
    all_chunks.extend(chunk_transformer_configs(root))
    all_chunks.extend(chunk_wrapper_reference(root))
    all_chunks.extend(chunk_wrapper_patterns(root))

    return all_chunks


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Chunk documents for the RAG pipeline"
    )
    parser.add_argument("--root", default=str(REPO_ROOT), help="Repo root")
    parser.add_argument(
        "--manifest", default=None, help="Path to registry_manifest.json"
    )
    args = parser.parse_args()

    manifest = None
    if args.manifest:
        with open(args.manifest) as f:
            manifest = json.load(f)

    root = Path(args.root)
    chunks = chunk_all(root, manifest)

    # Summary by collection
    collections: dict[str, int] = {}
    for c in chunks:
        col = c["metadata"].get("collection", "unknown")
        collections[col] = collections.get(col, 0) + 1

    print(f"Total chunks: {len(chunks)}")
    for col, count in sorted(collections.items()):
        print(f"  {col}: {count}")
