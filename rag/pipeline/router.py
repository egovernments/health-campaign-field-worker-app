"""
router.py

Query Router — Adaptive RAG pattern.
Routes user prompts to TEMPLATE / FORM / FULL_FLOW generation strategies.

LLM handles: classification + keyword extraction + detail extraction.
Code handles: completeness checking based on extracted details.
"""

import json
import re
from typing import Literal

from langchain_core.language_models import BaseChatModel
from pydantic import BaseModel, Field


# ---------------------------------------------------------------------------
# Models
# ---------------------------------------------------------------------------

class LLMRouteOutput(BaseModel):
    """What the LLM extracts from the user's request."""

    screen_type: Literal["TEMPLATE", "FORM", "FULL_FLOW"] = Field(
        description="TEMPLATE | FORM | FULL_FLOW"
    )
    intent_keywords: list[str] = Field(
        description="Keywords extracted from the request for retrieval"
    )
    widgets_mentioned: list[str] = Field(
        default_factory=list,
        description="Widget names the user mentioned"
    )
    sections_mentioned: dict = Field(
        default_factory=dict,
        description=(
            "Which sections the user specified widgets for. "
            'e.g. {"header": ["backLink"], "body": ["panelCard"], "footer": []}'
        )
    )
    actions_mentioned: list[str] = Field(
        default_factory=list,
        description="Actions/navigation the user described"
    )
    fields_mentioned: list[str] = Field(
        default_factory=list,
        description="Form field names or types the user mentioned"
    )
    page_count: int = Field(
        default=0,
        description="Number of form pages mentioned, 0 if not specified"
    )
    screens_mentioned: list[str] = Field(
        default_factory=list,
        description="Screen names or types mentioned for FULL_FLOW"
    )


class RouteQuery(BaseModel):
    """Final route result with completeness info."""

    screen_type: Literal["TEMPLATE", "FORM", "FULL_FLOW"]
    intent_keywords: list[str]
    is_complete: bool
    missing_info: list[str]


# ---------------------------------------------------------------------------
# LLM prompt — only classification + extraction, no completeness judgement
# ---------------------------------------------------------------------------

ROUTER_SYSTEM_PROMPT = """You are a DIGIT Flow Builder config request analyzer.

Your job is to:
1. Classify the user's request as TEMPLATE, FORM, or FULL_FLOW.
2. Extract details from the request. Only extract what the user actually mentions.

## Classification
TEMPLATE: any display screen — dashboards, lists, search screens, success/acknowledgement screens, detail views
FORM: data entry — any screen with form fields and pages
FULL_FLOW: multi-screen workflows combining multiple TEMPLATE and/or FORM screens

## Extraction
From the user's request, extract:
- intent_keywords: words useful for finding similar patterns
- widgets_mentioned: any widget names the user mentioned
- sections_mentioned: if the user specified which section (header/body/footer) a widget goes in, capture it as {"header": [...], "body": [...], "footer": [...]}. Only include sections the user explicitly mentioned.
- actions_mentioned: any actions or navigation the user described (e.g. "go home", "go back", "navigate to details")
- fields_mentioned: any form fields or field types mentioned
- page_count: number of form pages if mentioned, 0 if not
- screens_mentioned: screen names/types for multi-screen flows

Only extract what is in the request. Do not invent or assume anything.

You MUST respond with valid JSON matching this schema:
{
  "screen_type": "TEMPLATE" | "FORM" | "FULL_FLOW",
  "intent_keywords": [],
  "widgets_mentioned": [],
  "sections_mentioned": {},
  "actions_mentioned": [],
  "fields_mentioned": [],
  "page_count": 0,
  "screens_mentioned": []
}"""


# ---------------------------------------------------------------------------
# Code-based completeness checking
# ---------------------------------------------------------------------------

# What each screen type needs — categories only, no hardcoded questions.
# The LLM generates the actual user-facing questions from these tags.
TEMPLATE_REQUIREMENTS = ["widgets", "sections", "actions"]
FORM_REQUIREMENTS = ["fields", "pages", "submit_action"]
FULL_FLOW_REQUIREMENTS = ["screens", "navigation"]


def _check_completeness(
    screen_type: str,
    llm_output: LLMRouteOutput,
    user_query: str,
    user_answers: list[str] | None = None,
) -> tuple[bool, list[str]]:
    """Check completeness based on extracted details.

    Returns (is_complete, missing_categories) where missing_categories
    are tags like 'widgets', 'sections', etc. — NOT full question strings.
    The LLM later converts these tags into user-friendly questions.
    """
    missing = []
    full_text = user_query.lower()
    if user_answers:
        full_text += " " + " ".join(a.lower() for a in user_answers)

    if screen_type == "TEMPLATE":
        if not llm_output.widgets_mentioned:
            missing.append("widgets")
        if llm_output.widgets_mentioned and not llm_output.sections_mentioned:
            missing.append("sections")
        if not llm_output.actions_mentioned:
            nav_words = ["navigate", "go to", "go back", "go home", "redirect",
                         "open", "click", "tap", "button action"]
            if not any(w in full_text for w in nav_words):
                missing.append("actions")

    elif screen_type == "FORM":
        if not llm_output.fields_mentioned:
            missing.append("fields")
        if llm_output.page_count == 0 and len(llm_output.fields_mentioned) > 3:
            missing.append("pages")
        submit_words = ["submit", "save", "create", "after", "on complete", "on finish"]
        if not any(w in full_text for w in submit_words) and not llm_output.actions_mentioned:
            missing.append("submit_action")

    elif screen_type == "FULL_FLOW":
        if len(llm_output.screens_mentioned) < 2:
            missing.append("screens")
        nav_words = ["then", "after", "next", "navigate", "go to", "followed by"]
        if not any(w in full_text for w in nav_words):
            missing.append("navigation")

    return (len(missing) == 0, missing)


# ---------------------------------------------------------------------------
# Router factory
# ---------------------------------------------------------------------------

def create_router(llm: BaseChatModel) -> callable:
    """Create a router function.

    LLM classifies + extracts details.
    Code checks completeness based on extracted details.
    """

    def _parse_llm_output(llm_instance, messages) -> LLMRouteOutput:
        """Get LLM classification and extraction."""
        result = llm_instance.invoke(messages)
        content = result.content.strip()

        # Strip markdown code fences if present
        if content.startswith("```"):
            lines = content.split("\n")
            lines = [l for l in lines if not l.strip().startswith("```")]
            content = "\n".join(lines)

        try:
            data = json.loads(content)
        except json.JSONDecodeError:
            start = content.find("{")
            end = content.rfind("}") + 1
            if start >= 0 and end > start:
                data = json.loads(content[start:end])
            else:
                return LLMRouteOutput(
                    screen_type="TEMPLATE",
                    intent_keywords=[],
                )

        return LLMRouteOutput(**data)

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

        # Get LLM extraction
        try:
            structured_llm = llm.with_structured_output(LLMRouteOutput)
            llm_output = structured_llm.invoke(messages)
        except Exception:
            llm_output = _parse_llm_output(llm, messages)

        # Code-based completeness check
        is_complete, missing_info = _check_completeness(
            llm_output.screen_type,
            llm_output,
            query,
            user_answers,
        )

        return RouteQuery(
            screen_type=llm_output.screen_type,
            intent_keywords=llm_output.intent_keywords,
            is_complete=is_complete,
            missing_info=missing_info,
        )

    return route
