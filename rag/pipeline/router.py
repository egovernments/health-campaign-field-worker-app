"""
router.py

Query Router — Adaptive RAG pattern.
Routes user prompts to TEMPLATE / FORM / FULL_FLOW generation strategies.
Checks completeness and returns follow-up questions when info is missing.
"""

import json
from typing import Literal

from langchain_core.language_models import BaseChatModel
from pydantic import BaseModel, Field


class RouteQuery(BaseModel):
    """Route the user query and check if enough detail is provided."""

    screen_type: Literal["TEMPLATE", "FORM", "FULL_FLOW"] = Field(
        description=(
            "TEMPLATE: single display/list/dashboard screen. "
            "FORM: multi-page data entry form. "
            "FULL_FLOW: complete flow with multiple screens."
        )
    )
    intent_keywords: list[str] = Field(
        description=(
            "Extracted keywords for retrieval — widget names, entity names, "
            "action types, screen purpose (e.g. 'search', 'registration', 'dashboard')"
        )
    )
    is_complete: bool = Field(
        description=(
            "True if the prompt has enough detail to generate a correct config. "
            "False if critical information is missing."
        )
    )
    missing_info: list[str] = Field(
        default_factory=list,
        description=(
            "If is_complete is False, list what's missing. Examples: "
            "'entity type to register', 'form fields to capture', "
            "'what happens after submit', 'number of form pages'"
        ),
    )


ROUTER_SYSTEM_PROMPT = """You are a DIGIT Flow Builder config request analyzer.

Your job is to:
1. Classify the user's request as TEMPLATE (display/list/dashboard), FORM (data entry), or FULL_FLOW (multi-screen workflow).
2. Extract keywords useful for finding similar config patterns.
3. Determine if the request has enough detail to generate a correct config.

## Completeness Rules

TEMPLATE screens need:
- What the screen displays (list, dashboard, detail view, etc.)
- Ideally: data source entity, which widgets to use, navigation targets

FORM screens need:
- What data is being captured
- Ideally: field names/types, number of pages, field grouping per page, entity to create on submit

FULL_FLOW needs:
- High-level flow description
- Ideally: all screen types, fields, navigation between screens, post-submit behavior

Mark is_complete=True if the request has at least the minimum required info.
Mark is_complete=False and list missing_info if critical details are absent.

A request like "Create a registration flow" is INCOMPLETE — it doesn't say what entity, what fields, or what happens after.
A request like "Create a search screen with proximity search for HouseholdModel" is COMPLETE enough.

You MUST respond with valid JSON matching this exact schema:
{
  "screen_type": "TEMPLATE" | "FORM" | "FULL_FLOW",
  "intent_keywords": ["keyword1", "keyword2"],
  "is_complete": true | false,
  "missing_info": ["missing item 1"]
}"""


def create_router(llm: BaseChatModel) -> callable:
    """Create a router function using structured LLM output.

    Tries with_structured_output first, falls back to JSON parsing
    for better compatibility with local models.
    """

    def _parse_json_fallback(llm_instance, messages) -> RouteQuery:
        """Fallback: ask LLM to output JSON and parse it manually."""
        result = llm_instance.invoke(messages)
        content = result.content.strip()

        # Strip markdown code fences if present
        if content.startswith("```"):
            lines = content.split("\n")
            lines = [l for l in lines if not l.strip().startswith("```")]
            content = "\n".join(lines)

        # Try to find JSON in the response
        try:
            data = json.loads(content)
        except json.JSONDecodeError:
            # Try to extract JSON from mixed text
            start = content.find("{")
            end = content.rfind("}") + 1
            if start >= 0 and end > start:
                data = json.loads(content[start:end])
            else:
                # Default fallback
                return RouteQuery(
                    screen_type="TEMPLATE",
                    intent_keywords=[],
                    is_complete=True,
                    missing_info=[],
                )

        return RouteQuery(**data)

    def route(query: str, user_answers: list[str] | None = None) -> RouteQuery:
        full_context = query
        if user_answers:
            full_context += (
                "\n\nAdditional details from user:\n"
                + "\n".join(user_answers)
            )

        messages = [
            {"role": "system", "content": ROUTER_SYSTEM_PROMPT},
            {"role": "user", "content": full_context},
        ]

        # Try structured output first
        try:
            structured_llm = llm.with_structured_output(RouteQuery)
            return structured_llm.invoke(messages)
        except Exception:
            # Fallback to JSON parsing for local models
            return _parse_json_fallback(llm, messages)

    return route
