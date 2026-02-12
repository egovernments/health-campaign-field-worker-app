"""
registry_introspector.py

Extracts all registered widgets, actions, entities, and form formats
from the Dart source files. Produces registry_manifest.json consumed
by the RAG indexing pipeline.

Run this BEFORE building the vector index:
    python rag/registry_introspector.py --root . --output rag/registry_manifest.json
"""

import re
import json
import argparse
from pathlib import Path


def extract_widget_formats(repo_root: str) -> list[dict]:
    """Extract format strings from widget implementation files."""
    formats = []
    widget_dir = (
        Path(repo_root)
        / "packages/digit_flow_builder/lib/widgets/implementations"
    )

    for dart_file in sorted(widget_dir.glob("*.dart")):
        content = dart_file.read_text()

        # Match: String get format => 'xxx';
        # Handles multi-line case (e.g. text_widget.dart splits across two lines)
        match = re.search(
            r"String\s+get\s+format\s*=>\s*\n?\s*['\"](\w+)['\"]",
            content,
        )
        if not match:
            continue

        format_name = match.group(1)

        # Extract class name
        class_match = re.search(
            r"class\s+(\w+)\s+(?:extends|implements|with)", content
        )
        class_name = class_match.group(1) if class_match else "Unknown"

        # Extract JSON properties this widget reads
        json_reads = re.findall(r"json\[['\"]([\w]+)['\"]\]", content)

        formats.append(
            {
                "format": format_name,
                "class": class_name,
                "source_file": str(dart_file.relative_to(repo_root)),
                "json_properties_read": sorted(set(json_reads)),
                "supports_children": "children" in json_reads,
                "supports_child": "child" in json_reads,
                "supports_onAction": "onAction" in json_reads,
            }
        )

    # Deduplicate by format name (in case a format appears in multiple files)
    seen = set()
    unique = []
    for w in formats:
        if w["format"] not in seen:
            seen.add(w["format"])
            unique.append(w)

    return unique


def extract_action_types(repo_root: str) -> list[dict]:
    """Extract action types from ActionExecutorRegistry."""
    registry_file = (
        Path(repo_root)
        / "packages/digit_flow_builder/lib/action_handler/action_executor_registry.dart"
    )
    content = registry_file.read_text()

    actions = []
    for match in re.finditer(
        r"register\(\s*['\"](\w+)['\"]\s*,\s*(\w+)\(\)\s*\)", content
    ):
        actions.append(
            {
                "action_type": match.group(1),
                "executor_class": match.group(2),
                "source_file": str(registry_file.relative_to(repo_root)),
            }
        )

    # Deduplicate by action_type
    seen = set()
    unique = []
    for a in actions:
        if a["action_type"] not in seen:
            seen.add(a["action_type"])
            unique.append(a)

    return unique


def extract_enum_values(content: str, enum_name: str) -> list[str]:
    """Extract values from a Dart enum block."""
    pattern = rf"enum\s+{enum_name}\s*\{{([^}}]+)\}}"
    match = re.search(pattern, content, re.DOTALL)
    if not match:
        return []

    enum_body = match.group(1)
    values = []
    for line in enum_body.split(","):
        val = line.strip().rstrip(";").strip()
        # Skip empty lines and comments
        if val and not val.startswith("//"):
            values.append(val)
    return values


def extract_form_formats(repo_root: str) -> list[str]:
    """Extract PropertySchemaFormat enum values."""
    schema_file = (
        Path(repo_root)
        / "packages/digit_forms_engine/lib/models/property_schema/property_schema.dart"
    )
    content = schema_file.read_text()
    return extract_enum_values(content, "PropertySchemaFormat")


def extract_form_types(repo_root: str) -> list[str]:
    """Extract PropertySchemaType enum values."""
    schema_file = (
        Path(repo_root)
        / "packages/digit_forms_engine/lib/models/property_schema/property_schema.dart"
    )
    content = schema_file.read_text()
    return extract_enum_values(content, "PropertySchemaType")


def extract_entity_models(repo_root: str) -> list[dict]:
    """Extract entity model class names from digit_data_model."""
    entities = []
    model_dir = (
        Path(repo_root) / "packages/digit_data_model/lib/models/entities"
    )

    for dart_file in sorted(model_dir.glob("*.dart")):
        # Skip generated mapper files
        if dart_file.name.endswith(".mapper.dart"):
            continue

        content = dart_file.read_text()

        for match in re.finditer(
            r"class\s+(\w+Model)\s+(?:with|extends|implements)", content
        ):
            model_name = match.group(1)
            # Skip search models and companion classes
            if "SearchModel" in model_name or "Companion" in model_name:
                continue
            entities.append(
                {
                    "model_name": model_name,
                    "source_file": str(dart_file.relative_to(repo_root)),
                }
            )

    # Deduplicate
    seen = set()
    unique = []
    for e in entities:
        if e["model_name"] not in seen:
            seen.add(e["model_name"])
            unique.append(e)

    return unique


def extract_transformer_configs(repo_root: str) -> list[str]:
    """Extract transformer config names from transformer_config.dart."""
    config_file = (
        Path(repo_root)
        / "packages/digit_flow_builder/lib/data/transformer_config.dart"
    )
    content = config_file.read_text()

    # Match top-level string keys in the jsonConfig map
    # Pattern: "configName": {  or  'configName': {
    # Only match keys at the first nesting level (indented by 2 spaces)
    return re.findall(r'^\s{2}["\'](\w+)["\']\s*:\s*\{', content, re.MULTILINE)


def extract_custom_components(repo_root: str) -> list[str]:
    """Extract custom component registrations from the host app."""
    custom_names = []
    app_dir = Path(repo_root) / "apps"

    for dart_file in app_dir.rglob("*.dart"):
        try:
            content = dart_file.read_text()
        except Exception:
            continue

        for match in re.finditer(
            r"CustomComponentRegistry\(\)\.register(?:Builder)?\(\s*['\"](\w+)['\"]",
            content,
        ):
            custom_names.append(match.group(1))

    return sorted(set(custom_names))


def build_manifest(repo_root: str) -> dict:
    """Build the complete registry manifest."""
    widget_formats = extract_widget_formats(repo_root)
    action_types = extract_action_types(repo_root)
    form_formats = extract_form_formats(repo_root)
    form_types = extract_form_types(repo_root)
    entity_models = extract_entity_models(repo_root)
    transformer_configs = extract_transformer_configs(repo_root)
    custom_components = extract_custom_components(repo_root)

    return {
        "_meta": {
            "description": "Auto-generated registry manifest. DO NOT EDIT MANUALLY.",
            "source": "registry_introspector.py",
            "instruction": "Re-run the introspector after adding widgets/actions/entities.",
        },
        "template_widget_formats": {
            "count": len(widget_formats),
            "items": widget_formats,
            "all_format_names": [w["format"] for w in widget_formats],
        },
        "action_types": {
            "count": len(action_types),
            "items": action_types,
            "all_action_names": [a["action_type"] for a in action_types],
        },
        "form_field_formats": {
            "count": len(form_formats),
            "items": form_formats,
        },
        "form_field_types": {
            "count": len(form_types),
            "items": form_types,
        },
        "entity_models": {
            "count": len(entity_models),
            "items": entity_models,
            "all_model_names": [e["model_name"] for e in entity_models],
        },
        "transformer_configs": {
            "count": len(transformer_configs),
            "items": transformer_configs,
        },
        "custom_components": {
            "count": len(custom_components),
            "items": custom_components,
        },
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Extract registry values from Dart source files"
    )
    parser.add_argument("--root", required=True, help="Path to repo root")
    parser.add_argument(
        "--output", default="rag/registry_manifest.json", help="Output path"
    )
    args = parser.parse_args()

    manifest = build_manifest(args.root)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w") as f:
        json.dump(manifest, f, indent=2)

    print(f"Widget formats:      {manifest['template_widget_formats']['count']}")
    print(f"Action types:        {manifest['action_types']['count']}")
    print(f"Form field formats:  {manifest['form_field_formats']['count']}")
    print(f"Form field types:    {manifest['form_field_types']['count']}")
    print(f"Entity models:       {manifest['entity_models']['count']}")
    print(f"Transformer configs: {manifest['transformer_configs']['count']}")
    print(f"Custom components:   {manifest['custom_components']['count']}")
    print(f"\nManifest written to: {args.output}")
