"""
schema_generator.py

Reads registry_manifest.json and the original flow-config-schema.json,
then produces flow-config-schema-strict.json with:
  - Enum constraints on screenType, widget format, actionType, form formats/types
  - Conditional rules (TEMPLATE requires body, FORM requires pages)
  - Recursive widget structure (children/child refs)

Usage:
    python rag/schema_generator.py \
        --manifest rag/registry_manifest.json \
        --base-schema packages/digit_flow_builder/flow-config-schema.json \
        --output rag/flow-config-schema-strict.json
"""

import json
import copy
import argparse
from pathlib import Path


def load_manifest(manifest_path: str) -> dict:
    with open(manifest_path) as f:
        return json.load(f)


def load_base_schema(schema_path: str) -> dict:
    with open(schema_path) as f:
        return json.load(f)


def build_widget_schema(all_formats: list[str]) -> dict:
    """Build a recursive widget schema definition with format enum."""
    return {
        "type": "object",
        "properties": {
            "format": {
                "type": "string",
                "enum": sorted(all_formats),
            },
            "label": {"type": "string"},
            "description": {"type": "string"},
            "type": {"type": "string"},
            "fieldName": {"type": "string"},
            "value": {},
            "hidden": {},
            "visible": {},
            "disabled": {},
            "dataSource": {"type": "string"},
            "properties": {
                "type": "object",
                "additionalProperties": True,
            },
            "onAction": {
                "type": "array",
                "items": {"$ref": "#/definitions/actionConfig"},
            },
            "children": {
                "type": "array",
                "items": {"$ref": "#/definitions/widgetConfig"},
            },
            "child": {"$ref": "#/definitions/widgetConfig"},
        },
        "required": ["format"],
        "additionalProperties": True,
    }


def build_action_schema(all_actions: list[str]) -> dict:
    """Build action config schema with actionType enum."""
    return {
        "type": "object",
        "properties": {
            "actionType": {
                "type": "string",
                "enum": sorted(all_actions),
            },
            "properties": {
                "type": "object",
                "additionalProperties": True,
            },
            "condition": {
                "type": "object",
                "properties": {
                    "expression": {"type": "string"},
                },
                "additionalProperties": True,
            },
            "actions": {
                "type": "array",
                "items": {"$ref": "#/definitions/actionConfig"},
            },
        },
        "required": ["actionType", "properties"],
        "additionalProperties": True,
    }


def build_form_property_schema(
    form_formats: list[str], form_types: list[str]
) -> dict:
    """Build form property schema with format and type enums."""
    return {
        "type": "object",
        "properties": {
            "type": {
                "type": "string",
                "enum": sorted(form_types),
            },
            "label": {"type": "string"},
            "order": {"type": "number"},
            "value": {},
            "format": {
                "type": "string",
                "enum": sorted(form_formats),
            },
            "hidden": {"type": "boolean"},
            "tooltip": {"type": "string"},
            "helpText": {"type": "string"},
            "infoText": {"type": "string"},
            "readOnly": {"type": "boolean"},
            "fieldName": {"type": "string"},
            "deleteFlag": {"type": "boolean"},
            "innerLabel": {"type": "string"},
            "systemDate": {"type": "boolean"},
            "errorMessage": {"type": "string"},
            "isMultiSelect": {"type": "boolean"},
            "includeInForm": {"type": "boolean"},
            "includeInSummary": {"type": "boolean"},
            "schemaCode": {"type": "string"},
            "validations": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "type": {"type": "string"},
                        "value": {},
                        "message": {"type": "string"},
                    },
                    "required": ["type"],
                    "additionalProperties": True,
                },
            },
            "enums": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "code": {"type": "string"},
                        "name": {"type": "string"},
                    },
                    "required": ["code", "name"],
                    "additionalProperties": True,
                },
            },
            "visibilityCondition": {
                "type": "object",
                "properties": {
                    "expression": {"type": "string"},
                },
                "required": ["expression"],
                "additionalProperties": True,
            },
        },
        "required": ["type", "label", "order", "format", "fieldName"],
        "additionalProperties": True,
    }


def build_page_schema(form_formats: list[str], form_types: list[str]) -> dict:
    """Build the page schema for FORM screens."""
    return {
        "type": "object",
        "properties": {
            "page": {"type": "string"},
            "type": {"type": "string"},
            "label": {"type": "string"},
            "order": {"type": "number"},
            "description": {"type": "string"},
            "actionLabel": {"type": "string"},
            "navigateTo": {
                "type": "object",
                "properties": {
                    "name": {"type": "string"},
                    "type": {"type": "string"},
                    "data": {
                        "type": "array",
                        "items": {
                            "type": "object",
                            "properties": {
                                "key": {"type": "string"},
                                "value": {"type": "string"},
                            },
                            "required": ["key", "value"],
                            "additionalProperties": True,
                        },
                    },
                },
                "required": ["name", "type"],
                "additionalProperties": True,
            },
            "properties": {
                "type": "array",
                "items": {
                    "$ref": "#/definitions/formProperty",
                },
            },
            "showAlertPopUp": {
                "type": "object",
                "additionalProperties": True,
            },
        },
        "required": ["page", "type", "label", "order", "properties"],
        "additionalProperties": True,
    }


def build_wrapper_config_schema(entity_models: list[str]) -> dict:
    """Build wrapperConfig schema with entity model enum."""
    return {
        "type": "object",
        "properties": {
            "wrapperName": {"type": "string"},
            "rootEntity": {
                "type": "string",
                "enum": sorted(entity_models),
            },
            "filters": {
                "type": "array",
                "items": {"type": "object", "additionalProperties": True},
            },
            "relations": {
                "type": "array",
                "items": {
                    "type": "object",
                    "properties": {
                        "name": {"type": "string"},
                        "entity": {
                            "type": "string",
                            "enum": sorted(entity_models),
                        },
                        "match": {
                            "type": "object",
                            "additionalProperties": True,
                        },
                    },
                    "additionalProperties": True,
                },
            },
            "searchConfig": {
                "type": "object",
                "additionalProperties": True,
            },
        },
        "required": ["wrapperName", "rootEntity"],
        "additionalProperties": True,
    }


def build_screen_schema(manifest: dict) -> dict:
    """Build the flow screen schema with conditional rules."""
    all_formats = sorted(
        set(manifest["template_widget_formats"]["all_format_names"])
        | set(manifest["custom_components"]["items"])
    )
    all_actions = manifest["action_types"]["all_action_names"]
    form_formats = manifest["form_field_formats"]["items"]
    form_types = manifest["form_field_types"]["items"]
    entity_models = manifest["entity_models"]["all_model_names"]

    return {
        "type": "object",
        "properties": {
            "screenType": {
                "type": "string",
                "enum": ["TEMPLATE", "FORM"],
            },
            "name": {"type": "string"},
            "heading": {"type": "string"},
            "description": {"type": "string"},
            "project": {"type": "string"},
            "version": {"type": "number"},
            "disabled": {"type": "boolean"},
            "isSelected": {"type": "boolean"},
            "header": {
                "type": "array",
                "items": {"$ref": "#/definitions/widgetConfig"},
            },
            "footer": {
                "type": "array",
                "items": {"$ref": "#/definitions/widgetConfig"},
            },
            "body": {
                "type": "array",
                "items": {"$ref": "#/definitions/widgetConfig"},
            },
            "pages": {
                "type": "array",
                "items": {"$ref": "#/definitions/pageConfig"},
            },
            "initActions": {
                "type": "array",
                "items": {"$ref": "#/definitions/actionConfig"},
            },
            "onAction": {
                "type": "array",
                "items": {"$ref": "#/definitions/actionConfig"},
            },
            "wrapperConfig": {
                "$ref": "#/definitions/wrapperConfig",
            },
        },
        "required": ["screenType", "name"],
        "allOf": [
            {
                "if": {
                    "properties": {
                        "screenType": {"const": "TEMPLATE"}
                    }
                },
                "then": {
                    "required": ["body"],
                },
            },
            {
                "if": {
                    "properties": {
                        "screenType": {"const": "FORM"}
                    }
                },
                "then": {
                    "required": ["pages"],
                },
            },
        ],
        "additionalProperties": True,
    }


def generate_strict_schema(manifest: dict, base_schema: dict) -> dict:
    """Generate the strict schema from manifest and base schema."""
    all_formats = sorted(
        set(manifest["template_widget_formats"]["all_format_names"])
        | set(manifest["custom_components"]["items"])
    )
    all_actions = manifest["action_types"]["all_action_names"]
    form_formats = manifest["form_field_formats"]["items"]
    form_types = manifest["form_field_types"]["items"]
    entity_models = manifest["entity_models"]["all_model_names"]

    strict_schema = {
        "$schema": "http://json-schema.org/draft-07/schema#",
        "title": "DIGIT Flow Builder Configuration Schema (Strict)",
        "description": (
            "Auto-generated strict schema with enum constraints. "
            "DO NOT EDIT MANUALLY. Regenerate with schema_generator.py."
        ),
        "type": "object",
        "definitions": {
            "widgetConfig": build_widget_schema(all_formats),
            "actionConfig": build_action_schema(all_actions),
            "formProperty": build_form_property_schema(
                form_formats, form_types
            ),
            "pageConfig": build_page_schema(form_formats, form_types),
            "wrapperConfig": build_wrapper_config_schema(entity_models),
        },
        "properties": {
            "name": {"type": "string"},
            "initialPage": {"type": "string"},
            "project": {"type": "string"},
            "version": {"type": "number"},
            "disabled": {"type": "boolean"},
            "isSelected": {"type": "boolean"},
            "flows": {
                "type": "array",
                "items": build_screen_schema(manifest),
            },
        },
        "required": ["name", "flows"],
        "additionalProperties": True,
    }

    return strict_schema


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate strict JSON schema from registry manifest"
    )
    parser.add_argument(
        "--manifest",
        required=True,
        help="Path to registry_manifest.json",
    )
    parser.add_argument(
        "--base-schema",
        required=True,
        help="Path to original flow-config-schema.json",
    )
    parser.add_argument(
        "--output",
        default="rag/flow-config-schema-strict.json",
        help="Output path for strict schema",
    )
    args = parser.parse_args()

    manifest = load_manifest(args.manifest)
    base_schema = load_base_schema(args.base_schema)
    strict_schema = generate_strict_schema(manifest, base_schema)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w") as f:
        json.dump(strict_schema, f, indent=2)

    # Summary
    defs = strict_schema["definitions"]
    widget_enum = defs["widgetConfig"]["properties"]["format"]["enum"]
    action_enum = defs["actionConfig"]["properties"]["actionType"]["enum"]
    form_fmt_enum = defs["formProperty"]["properties"]["format"]["enum"]
    form_type_enum = defs["formProperty"]["properties"]["type"]["enum"]
    entity_enum = defs["wrapperConfig"]["properties"]["rootEntity"]["enum"]

    print(f"Strict schema generated:")
    print(f"  Widget format enum:  {len(widget_enum)} values")
    print(f"  Action type enum:    {len(action_enum)} values")
    print(f"  Form format enum:    {len(form_fmt_enum)} values")
    print(f"  Form type enum:      {len(form_type_enum)} values")
    print(f"  Entity model enum:   {len(entity_enum)} values")
    print(f"  Conditional rules:   TEMPLATE→body, FORM→pages")
    print(f"\nStrict schema written to: {args.output}")
