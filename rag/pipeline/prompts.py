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
10. Output ONLY valid JSON. No commentary, no markdown fences, no explanation.

## USING EXEMPLAR CONFIGS
Each exemplar config below starts with a "SECTION PATTERN" summary showing which widgets are in header, body, and footer in that particular example.
- Use these as REFERENCE to understand how similar screens have been built before.
- Widget placement (header/body/footer) is flexible — it depends on what the user wants.
- Study the widget nesting structures in exemplars (e.g. panelCard has primaryAction/secondaryAction properties that contain button configs with onAction arrays).
- If the user's request does not clearly specify placement or structure, the pipeline should ask follow-up questions rather than guess."""


# ---------------------------------------------------------------------------
# TEMPLATE screen generation
# ---------------------------------------------------------------------------

def build_template_prompt(
    manifest: RegistryManifest,
    schema_context: str,
    exemplar_context: str,
    widget_context: str,
    user_query: str,
    wrapper_context: str = "",
    previous_errors: list[str] | None = None,
) -> str:
    """Build the generation prompt for a TEMPLATE screen."""
    error_section = ""
    if previous_errors:
        error_section = f"""
## PREVIOUS GENERATION ERRORS (fix these)
{chr(10).join(f'- {e}' for e in previous_errors)}
"""

    wrapper_section = ""
    if wrapper_context:
        wrapper_section = f"""
## WRAPPER CONFIG REFERENCE (for data-driven screens)
{wrapper_context}
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
{wrapper_section}{error_section}
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
    wrapper_context: str = "",
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

## WRAPPER CONFIG REFERENCE
{wrapper_context}
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
# Follow-up question generation prompt (domain-aware)
# ---------------------------------------------------------------------------

def build_gather_info_prompt(
    manifest: RegistryManifest,
    route: str,
    user_query: str,
    missing_categories: list[str],
) -> str:
    """Build a domain-specific follow-up question prompt.

    Injects available values from the manifest so the LLM can offer
    concrete, domain-specific choices instead of generic web dev questions.
    """
    category_guidance = []

    for cat in missing_categories:
        if cat == "widgets":
            category_guidance.append(
                f"widgets — Ask which widget types to display on screen. "
                f"Available widget formats: {', '.join(sorted(manifest.all_widget_formats))}. "
                f"Common choices for search screens: listView, searchBar, panelCard, textTemplate. "
                f"Common choices for dashboards: statusCard, panelCard, listView, sideBar."
            )
        elif cat == "actions":
            category_guidance.append(
                f"actions — Ask what happens when the user interacts (taps a button, selects a list item, etc.). "
                f"Available action types: {', '.join(sorted(manifest.action_types))}. "
                f"Common: NAVIGATION (go to another screen), SEARCH (query data), "
                f"CREATE/UPDATE/DELETE (modify entity data)."
            )
        elif cat == "entity":
            category_guidance.append(
                f"entity — Ask which data entity this screen reads/writes. "
                f"Available entity models: {', '.join(sorted(manifest.entity_models))}."
            )
        elif cat == "fields":
            category_guidance.append(
                f"fields — Ask what form fields to capture. "
                f"Available field formats: {', '.join(sorted(manifest.form_formats))}. "
                f"Available field types: {', '.join(sorted(manifest.form_types))}. "
                f"Examples: text (name), numeric (quantity), date, select/dropdown (options), "
                f"mobileNumber, latLng (GPS location), scanner (barcode)."
            )
        elif cat == "pages":
            category_guidance.append(
                "pages — Ask how many form pages and how to group fields across pages. "
                "Example: 'Should personal details be on page 1 and address on page 2?'"
            )
        elif cat == "submit_action":
            category_guidance.append(
                f"submit_action — Ask what happens after form submission. "
                f"Available action types: {', '.join(sorted(manifest.action_types))}. "
                f"Common: CREATE entity then navigate back, or CREATE then go to success screen."
            )
        elif cat == "screens":
            category_guidance.append(
                "screens — Ask what screens make up the flow (e.g., search → results → detail → edit form)."
            )
        elif cat == "navigation":
            category_guidance.append(
                "navigation — Ask how users move between screens. "
                "TEMPLATE-to-TEMPLATE uses NAVIGATION action, TEMPLATE-to-FORM uses NAVIGATION with form name."
            )

    guidance_text = "\n".join(f"- {g}" for g in category_guidance)

    return f"""You are a DIGIT Flow Builder config assistant gathering requirements.

The DIGIT Flow Builder renders mobile app screens from JSON configs. Screens are either:
- TEMPLATE: display screens (dashboards, search results, detail views, lists)
- FORM: data entry screens (multi-page forms with fields and validation)

The user wants a {route} screen: "{user_query}"

The following details are still needed. For each, ask ONE short, specific question
with concrete choices from the available values:

{guidance_text}

RULES:
- Ask exactly ONE question per missing item listed above
- Offer 2-4 specific choices from the available values in each question
- Questions must reference DIGIT Flow Builder concepts (widget formats, action types, entity models)
- Do NOT ask generic web development questions
- Do NOT ask about header/body/footer placement (the system infers this from patterns)
- Do NOT ask about URLs, server requests, or web concepts
- Keep questions short and actionable

Output one question per line. No numbering, no bullets."""
