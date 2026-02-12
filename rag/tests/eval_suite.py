"""
eval_suite.py

Evaluation test cases for the config generation pipeline.
Each case defines an input prompt and expected structural properties.

Run standalone: python rag/tests/eval_suite.py
Run with pytest: python -m pytest rag/tests/eval_suite.py -v
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from pipeline.manifest import RegistryManifest
from pipeline.validator import validate_full

RAG_DIR = Path(__file__).resolve().parent.parent
MANIFEST_PATH = RAG_DIR / "registry_manifest.json"
STRICT_SCHEMA_PATH = RAG_DIR / "flow-config-schema-strict.json"


# ---------------------------------------------------------------------------
# Eval cases: each specifies the prompt and what the generated config
# should structurally contain. These are used for offline evaluation
# after running the pipeline.
# ---------------------------------------------------------------------------

EVAL_CASES = [
    {
        "name": "simple_dashboard",
        "prompt": (
            "Create a stock management dashboard with 4 menu cards: "
            "Stock Receipt, Stock Issued, Stock Returned, Stock Reconciliation."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["menu_card"],
        "min_widget_count": 4,
    },
    {
        "name": "search_screen",
        "prompt": (
            "Create a beneficiary search screen with proximity search, "
            "a search bar to filter by name, an action popup for options, "
            "and a list view showing results."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["proximitySearch", "searchBar", "actionPopup", "listView"],
    },
    {
        "name": "simple_form",
        "prompt": (
            "Create a 2-page household registration form. "
            "Page 1 captures GPS location and locality dropdown. "
            "Page 2 captures head of household name (text), "
            "date of birth (dob), gender (radio), and phone (mobileNumber). "
            "On submit, create a HouseholdModel entity."
        ),
        "expected_screen_type": "FORM",
        "expected_form_formats": ["latLng", "locality", "text", "dob", "radio", "mobileNumber"],
        "min_pages": 2,
        "expected_actions": ["CREATE_EVENT"],
    },
    {
        "name": "detail_view",
        "prompt": (
            "Create a household detail view that shows all member information "
            "in a label-pair list, with a back link in the header and an "
            "info card for empty state."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["labelPairList", "backLink", "infoCard"],
    },
    {
        "name": "success_screen",
        "prompt": (
            "Create a delivery success acknowledgment screen with a "
            "panelCard showing success status and two buttons: "
            "'Back to Search' and 'New Delivery'."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["panelCard", "button"],
        "min_widget_count": 3,
    },
    {
        "name": "form_with_validations",
        "prompt": (
            "Create a single-page complaint form with: "
            "complaint type (dropdown with options), "
            "description (textArea, required, minLength 10), "
            "and date of complaint (date, required). "
            "On submit, create a TaskModel."
        ),
        "expected_screen_type": "FORM",
        "expected_form_formats": ["dropdown", "textArea", "date"],
        "expected_actions": ["CREATE_EVENT"],
    },
    {
        "name": "filtered_list",
        "prompt": (
            "Create a facility list screen with a filter widget to filter "
            "by facility type, a search bar, and a list view showing "
            "facility cards with name and stock count tags."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["filter", "searchBar", "listView", "card", "tag"],
    },
    {
        "name": "screen_with_init_actions",
        "prompt": (
            "Create a stock receipt detail screen that on init searches for "
            "StockModel by facilityId, shows results in a table, and has "
            "a back link header."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["table", "backLink"],
        "expected_actions": ["SEARCH_EVENT"],
    },
    {
        "name": "expandable_sections",
        "prompt": (
            "Create a settings screen with expandable sections for "
            "notification preferences and data sync options."
        ),
        "expected_screen_type": "TEMPLATE",
        "expected_widgets": ["expandable"],
        "min_widget_count": 2,
    },
    {
        "name": "scanner_form",
        "prompt": (
            "Create a single-page form with a QR scanner field to scan "
            "beneficiary ID and a text field for manual entry as fallback. "
            "On submit, search for IndividualModel by scanned ID."
        ),
        "expected_screen_type": "FORM",
        "expected_form_formats": ["scanner", "text"],
        "expected_actions": ["SEARCH_EVENT"],
    },
]


def validate_generated_config(config: dict, case: dict) -> list[str]:
    """Validate a generated config against eval case expectations.

    Returns a list of issues (empty = all checks passed).
    """
    issues = []

    # 1. Schema + semantic validation
    manifest = RegistryManifest(str(MANIFEST_PATH))
    is_valid, errors = validate_full(config, manifest, str(STRICT_SCHEMA_PATH))
    if not is_valid:
        issues.extend([f"Validation: {e}" for e in errors])

    flows = config.get("flows", [])
    if not flows:
        issues.append("No flows found in config")
        return issues

    # Check first screen (main screen for single-screen cases)
    screen = flows[0]

    # 2. Screen type check
    expected_type = case.get("expected_screen_type")
    if expected_type and screen.get("screenType") != expected_type:
        issues.append(
            f"Expected screenType={expected_type}, "
            f"got {screen.get('screenType')}"
        )

    # 3. Widget format check
    expected_widgets = case.get("expected_widgets", [])
    if expected_widgets:
        all_formats = _collect_formats(screen)
        for w in expected_widgets:
            if w not in all_formats:
                issues.append(f"Expected widget '{w}' not found in config")

    # 4. Minimum widget count
    min_count = case.get("min_widget_count")
    if min_count:
        all_formats = _collect_formats(screen)
        if len(all_formats) < min_count:
            issues.append(
                f"Expected at least {min_count} widgets, found {len(all_formats)}"
            )

    # 5. Form format check
    expected_form_fmts = case.get("expected_form_formats", [])
    if expected_form_fmts:
        form_formats = _collect_form_formats(screen)
        for fmt in expected_form_fmts:
            if fmt not in form_formats:
                issues.append(f"Expected form format '{fmt}' not found")

    # 6. Minimum pages
    min_pages = case.get("min_pages")
    if min_pages:
        pages = screen.get("pages", [])
        if len(pages) < min_pages:
            issues.append(
                f"Expected at least {min_pages} pages, found {len(pages)}"
            )

    # 7. Expected action types
    expected_actions = case.get("expected_actions", [])
    if expected_actions:
        all_actions = _collect_actions(screen)
        for a in expected_actions:
            if a not in all_actions:
                issues.append(f"Expected action '{a}' not found in config")

    return issues


def _collect_formats(config: dict | list, formats: set | None = None) -> set:
    """Recursively collect all widget format strings."""
    if formats is None:
        formats = set()
    if isinstance(config, dict):
        if "format" in config:
            formats.add(config["format"])
        for v in config.values():
            _collect_formats(v, formats)
    elif isinstance(config, list):
        for item in config:
            _collect_formats(item, formats)
    return formats


def _collect_form_formats(screen: dict) -> set:
    """Collect format values from FORM page properties."""
    formats = set()
    for page in screen.get("pages", []):
        for prop in page.get("properties", []):
            if "format" in prop:
                formats.add(prop["format"])
    return formats


def _collect_actions(config: dict | list, actions: set | None = None) -> set:
    """Recursively collect all actionType strings."""
    if actions is None:
        actions = set()
    if isinstance(config, dict):
        if "actionType" in config:
            actions.add(config["actionType"])
        for v in config.values():
            _collect_actions(v, actions)
    elif isinstance(config, list):
        for item in config:
            _collect_actions(item, actions)
    return actions


if __name__ == "__main__":
    print(f"Eval suite: {len(EVAL_CASES)} test cases defined")
    print()
    for case in EVAL_CASES:
        print(f"  [{case['name']}]")
        print(f"    Type: {case.get('expected_screen_type', 'any')}")
        print(f"    Prompt: {case['prompt'][:80]}...")
        print()
    print(
        "To evaluate, run the pipeline for each case and pass the output "
        "to validate_generated_config()."
    )
