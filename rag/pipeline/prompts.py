"""
prompts.py

All prompt templates for the RAG pipeline.
Every prompt injects allowed values dynamically from RegistryManifest.
"""

from .manifest import RegistryManifest


# ---------------------------------------------------------------------------
# System-level rules (shared across all generation prompts)
# ---------------------------------------------------------------------------

SYSTEM_RULES = """## ABSOLUTE RULES
1. You may ONLY use widget formats from the AVAILABLE list below.
2. You may ONLY use action types from the AVAILABLE list below.
3. You may ONLY use entity models from the AVAILABLE list below.
4. Config keys must match the schema exactly. Do NOT invent new keys.
5. All labels must be SCREAMING_SNAKE_CASE localization keys following MODULE_SCREEN_FIELD_LABEL pattern.
6. Screen names in flows must be camelCase.
7. Form names must be UPPER_CASE.
8. Form field names (fieldName) must be camelCase.
9. Template interpolation uses: {{key}}, {{fn:functionName}}, {{singleton.*}}, {{item.*}}, {{context.*}}
10. Output ONLY valid JSON. No commentary, no markdown fences, no explanation."""


# ---------------------------------------------------------------------------
# TEMPLATE screen generation
# ---------------------------------------------------------------------------

def build_template_prompt(
    manifest: RegistryManifest,
    schema_context: str,
    exemplar_context: str,
    widget_context: str,
    user_query: str,
    previous_errors: list[str] | None = None,
) -> str:
    """Build the generation prompt for a TEMPLATE screen."""
    error_section = ""
    if previous_errors:
        error_section = f"""
## PREVIOUS GENERATION ERRORS (fix these)
{chr(10).join(f'- {e}' for e in previous_errors)}
"""

    return f"""You are a DIGIT Flow Builder config generator.
You generate JSON configurations that conform EXACTLY to the DIGIT Flow Builder schema.

{SYSTEM_RULES}

## AVAILABLE WIDGET FORMATS (auto-extracted from widget registry)
{', '.join(sorted(manifest.all_widget_formats))}

## AVAILABLE ACTION TYPES (auto-extracted from action executor registry)
{', '.join(sorted(manifest.action_types))}

## AVAILABLE ENTITY MODELS (auto-extracted from digit_data_model)
{', '.join(sorted(manifest.entity_models))}

## OUTPUT STRUCTURE (wrap screens in a flow)
{{
  "name": "<flowName>",
  "flows": [
    {{
      "screenType": "TEMPLATE",
      "name": "<camelCase screen name>",
      "heading": "<SCREAMING_SNAKE_CASE localization key>",
      "description": "<SCREAMING_SNAKE_CASE localization key>",
      "header": [ <widget configs> ],
      "body": [ <widget configs> ],
      "footer": [ <widget configs> ],
      "initActions": [ <action configs> ],
      "wrapperConfig": {{ <wrapper config if data-driven> }}
    }}
  ]
}}
IMPORTANT: Every screen object inside "flows" MUST have both "screenType" and "name".

## SCHEMA REFERENCE
{schema_context}

## SIMILAR EXISTING CONFIGS (use as patterns, do not copy verbatim)
{exemplar_context}

## WIDGET PROPERTY REFERENCE
{widget_context}
{error_section}
## USER REQUEST
{user_query}

Generate a valid TEMPLATE screen JSON config."""


# ---------------------------------------------------------------------------
# FORM screen generation
# ---------------------------------------------------------------------------

def build_form_prompt(
    manifest: RegistryManifest,
    schema_context: str,
    exemplar_context: str,
    user_query: str,
    previous_errors: list[str] | None = None,
) -> str:
    """Build the generation prompt for a FORM screen."""
    error_section = ""
    if previous_errors:
        error_section = f"""
## PREVIOUS GENERATION ERRORS (fix these)
{chr(10).join(f'- {e}' for e in previous_errors)}
"""

    return f"""You are a DIGIT Flow Builder config generator.
You generate JSON configurations that conform EXACTLY to the DIGIT Flow Builder schema.

{SYSTEM_RULES}

## AVAILABLE FORM FIELD FORMATS (auto-extracted from PropertySchemaFormat enum)
{', '.join(sorted(manifest.form_formats))}

## AVAILABLE FORM FIELD TYPES (auto-extracted from PropertySchemaType enum)
{', '.join(sorted(manifest.form_types))}

## AVAILABLE ACTION TYPES (auto-extracted from action executor registry)
{', '.join(sorted(manifest.action_types))}

## AVAILABLE ENTITY MODELS (auto-extracted from digit_data_model)
{', '.join(sorted(manifest.entity_models))}

## AVAILABLE WIDGET FORMATS (for header/footer widgets in FORM screens)
{', '.join(sorted(manifest.all_widget_formats))}

## OUTPUT STRUCTURE (wrap screens in a flow)
{{
  "name": "<flowName>",
  "flows": [
    {{
      "screenType": "FORM",
      "name": "<UPPER_CASE form name>",
      "pages": [
    {{
      "page": "<camelCase page name>",
      "type": "object",
      "label": "<SCREAMING_SNAKE_CASE>",
      "order": <integer>,
      "navigateTo": {{ "name": "<next page>", "type": "form" }},
      "properties": [
        {{
          "type": "<string|integer|boolean|dynamic>",
          "label": "<SCREAMING_SNAKE_CASE>",
          "order": <integer>,
          "format": "<one of the available form field formats>",
          "fieldName": "<camelCase>",
          "validations": [ {{ "type": "<rule>", "value": <val>, "message": "<SCREAMING_SNAKE_CASE key>" }} ]
        }}
      ]
    }}
  ],
  "onAction": [ <action configs for form submission> ]
    }}
  ]
}}
IMPORTANT: Every screen object inside "flows" MUST have both "screenType" and "name".

## AVAILABLE VALIDATION TYPES
required, minLength, maxLength, min, max, regex, notEqualTo, isGS1

## SCHEMA REFERENCE
{schema_context}

## SIMILAR EXISTING CONFIGS (use as patterns, do not copy verbatim)
{exemplar_context}
{error_section}
## USER REQUEST
{user_query}

Generate a valid FORM screen JSON config."""


# ---------------------------------------------------------------------------
# FULL_FLOW generation (multi-screen)
# ---------------------------------------------------------------------------

def build_full_flow_prompt(
    manifest: RegistryManifest,
    schema_context: str,
    exemplar_context: str,
    widget_context: str,
    user_query: str,
    previous_errors: list[str] | None = None,
) -> str:
    """Build the generation prompt for a complete multi-screen flow."""
    error_section = ""
    if previous_errors:
        error_section = f"""
## PREVIOUS GENERATION ERRORS (fix these)
{chr(10).join(f'- {e}' for e in previous_errors)}
"""

    return f"""You are a DIGIT Flow Builder config generator.
You generate complete flow configurations with multiple screens.

{SYSTEM_RULES}

## AVAILABLE WIDGET FORMATS
{', '.join(sorted(manifest.all_widget_formats))}

## AVAILABLE FORM FIELD FORMATS
{', '.join(sorted(manifest.form_formats))}

## AVAILABLE FORM FIELD TYPES
{', '.join(sorted(manifest.form_types))}

## AVAILABLE ACTION TYPES
{', '.join(sorted(manifest.action_types))}

## AVAILABLE ENTITY MODELS
{', '.join(sorted(manifest.entity_models))}

## FULL FLOW STRUCTURE
{{
  "name": "<flowName>",
  "initialPage": "<first screen name>",
  "version": 1,
  "flows": [
    {{ <TEMPLATE or FORM screen configs> }},
    ...
  ]
}}

Each screen in "flows" follows either the TEMPLATE or FORM structure.
TEMPLATE screens have: screenType, name, header, body, footer, initActions, wrapperConfig
FORM screens have: screenType, name, pages, onAction

## NAVIGATION
- TEMPLATE→TEMPLATE: use NAVIGATION action with "type": "TEMPLATE", "name": "<targetScreenName>"
- TEMPLATE→FORM: use NAVIGATION action with "type": "FORM", "name": "<FORM_NAME>"
- FORM page→page: use "navigateTo": {{"name": "<nextPage>", "type": "form"}}
- FORM→TEMPLATE: use onAction with NAVIGATION after form submit actions

## SCHEMA REFERENCE
{schema_context}

## EXISTING FLOW PATTERNS
{exemplar_context}

## WIDGET REFERENCE
{widget_context}
{error_section}
## USER REQUEST
{user_query}

Generate a complete valid flow JSON config with all screens."""


# ---------------------------------------------------------------------------
# Correction prompt
# ---------------------------------------------------------------------------

def build_correction_prompt(
    manifest: RegistryManifest,
    original_config: str,
    errors: list[str],
) -> str:
    """Build prompt for corrective rewriting."""
    return f"""The following DIGIT Flow Builder config has validation errors.
Fix ONLY the errors listed below. Do not change anything else.
Output ONLY the corrected JSON, no commentary.

## ERRORS
{chr(10).join(f'- {e}' for e in errors)}

## REQUIRED STRUCTURE REFERENCE
A valid config wraps screens inside "flows". Each flow item MUST have "name":
{{
  "name": "<flowName>",
  "flows": [
    {{
      "screenType": "TEMPLATE",
      "name": "<camelCase screen name>",
      "body": [ ... ]
    }}
  ]
}}
- Every object in "flows" MUST include "name" and "screenType"
- TEMPLATE screens MUST have "body"
- FORM screens MUST have "pages"
- Widget objects use "format" (not "widgetFormat")

## ALLOWED WIDGET FORMATS
{', '.join(sorted(manifest.all_widget_formats))}

## ALLOWED ACTION TYPES
{', '.join(sorted(manifest.action_types))}

## ALLOWED FORM FIELD FORMATS
{', '.join(sorted(manifest.form_formats))}

## ALLOWED ENTITY MODELS
{', '.join(sorted(manifest.entity_models))}

## ORIGINAL CONFIG
{original_config}

Output the corrected JSON only."""


# ---------------------------------------------------------------------------
# Query expansion prompt (RAG Fusion)
# ---------------------------------------------------------------------------

QUERY_EXPANSION_PROMPT = """Given this request for a DIGIT Flow Builder config:
"{user_query}"

Generate 3 focused search queries to find relevant config patterns:
1. One focused on the SCREEN TYPE and LAYOUT (widgets needed)
2. One focused on DATA and ACTIONS (entities, search, create)
3. One focused on NAVIGATION and WORKFLOW (screen transitions)

Output one query per line, no numbering or bullets."""


# ---------------------------------------------------------------------------
# Follow-up question generation prompt
# ---------------------------------------------------------------------------

GATHER_INFO_PROMPT = """The user wants to create a {route} config but their request is missing details.

Missing information:
{missing_items}

Generate 2-4 short, specific follow-up questions to gather the missing info.
Each question should offer concrete choices where possible.
Output one question per line, no numbering."""
