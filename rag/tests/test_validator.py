"""
test_validator.py

Tests for the two-stage validator (JSON Schema + semantic).
Run: python -m pytest rag/tests/test_validator.py -v
"""

import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from pipeline.manifest import RegistryManifest
from pipeline.validator import validate_schema, validate_semantic, validate_full

RAG_DIR = Path(__file__).resolve().parent.parent
MANIFEST_PATH = RAG_DIR / "registry_manifest.json"
STRICT_SCHEMA_PATH = RAG_DIR / "flow-config-schema-strict.json"


@pytest.fixture(scope="module")
def manifest():
    return RegistryManifest(str(MANIFEST_PATH))


# ---------------------------------------------------------------------------
# Valid configs
# ---------------------------------------------------------------------------

def _make_valid_template():
    return {
        "name": "testFlow",
        "flows": [
            {
                "screenType": "TEMPLATE",
                "name": "searchScreen",
                "body": [
                    {
                        "format": "searchBar",
                        "label": "TEST_SEARCH_LABEL",
                    }
                ],
            }
        ],
    }


def _make_valid_form():
    return {
        "name": "testFormFlow",
        "flows": [
            {
                "screenType": "FORM",
                "name": "TESTFORM",
                "pages": [
                    {
                        "page": "personalDetails",
                        "type": "object",
                        "label": "TEST_PAGE_LABEL",
                        "order": 1,
                        "properties": [
                            {
                                "type": "string",
                                "label": "TEST_NAME_LABEL",
                                "order": 1,
                                "format": "text",
                                "fieldName": "firstName",
                            }
                        ],
                    }
                ],
            }
        ],
    }


# ---------------------------------------------------------------------------
# Schema validation tests
# ---------------------------------------------------------------------------

class TestSchemaValidation:
    def test_valid_template_passes(self):
        ok, errors = validate_schema(_make_valid_template(), STRICT_SCHEMA_PATH)
        assert ok, f"Expected valid but got errors: {errors}"

    def test_valid_form_passes(self):
        ok, errors = validate_schema(_make_valid_form(), STRICT_SCHEMA_PATH)
        assert ok, f"Expected valid but got errors: {errors}"

    def test_unknown_widget_format_fails(self):
        config = _make_valid_template()
        config["flows"][0]["body"][0]["format"] = "NONEXISTENT_WIDGET"
        ok, errors = validate_schema(config, STRICT_SCHEMA_PATH)
        assert not ok
        assert any("NONEXISTENT_WIDGET" in e for e in errors)

    def test_template_without_body_fails(self):
        config = {
            "name": "test",
            "flows": [{"screenType": "TEMPLATE", "name": "s1"}],
        }
        ok, errors = validate_schema(config, STRICT_SCHEMA_PATH)
        assert not ok
        assert any("body" in e for e in errors)

    def test_form_without_pages_fails(self):
        config = {
            "name": "test",
            "flows": [{"screenType": "FORM", "name": "F1"}],
        }
        ok, errors = validate_schema(config, STRICT_SCHEMA_PATH)
        assert not ok
        assert any("pages" in e for e in errors)

    def test_missing_name_fails(self):
        config = {"flows": [{"screenType": "TEMPLATE", "name": "s1", "body": []}]}
        ok, errors = validate_schema(config, STRICT_SCHEMA_PATH)
        assert not ok


# ---------------------------------------------------------------------------
# Semantic validation tests
# ---------------------------------------------------------------------------

class TestSemanticValidation:
    def test_valid_template_passes(self, manifest):
        ok, errors = validate_semantic(_make_valid_template(), manifest)
        assert ok, f"Expected valid but got errors: {errors}"

    def test_valid_form_passes(self, manifest):
        ok, errors = validate_semantic(_make_valid_form(), manifest)
        assert ok, f"Expected valid but got errors: {errors}"

    def test_unknown_widget_format(self, manifest):
        config = _make_valid_template()
        config["flows"][0]["body"][0]["format"] = "fakeWidget"
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("fakeWidget" in e for e in errors)

    def test_unknown_action_type(self, manifest):
        config = _make_valid_template()
        config["flows"][0]["initActions"] = [
            {"actionType": "FAKE_ACTION", "properties": {}}
        ]
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("FAKE_ACTION" in e for e in errors)

    def test_unknown_entity_in_wrapper(self, manifest):
        config = _make_valid_template()
        config["flows"][0]["wrapperConfig"] = {
            "wrapperName": "TestWrapper",
            "rootEntity": "FakeEntityModel",
        }
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("FakeEntityModel" in e for e in errors)

    def test_unknown_relation_entity(self, manifest):
        config = _make_valid_template()
        config["flows"][0]["wrapperConfig"] = {
            "wrapperName": "TestWrapper",
            "rootEntity": "HouseholdModel",
            "relations": [
                {"name": "fake", "entity": "NonExistentModel"}
            ],
        }
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("NonExistentModel" in e for e in errors)

    def test_unknown_form_format(self, manifest):
        config = _make_valid_form()
        config["flows"][0]["pages"][0]["properties"][0]["format"] = "fakeFormat"
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("fakeFormat" in e for e in errors)

    def test_invalid_screen_type(self, manifest):
        config = {
            "name": "test",
            "flows": [{"screenType": "INVALID", "name": "s1"}],
        }
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("INVALID" in e for e in errors)

    def test_recursive_children_validation(self, manifest):
        config = _make_valid_template()
        config["flows"][0]["body"] = [
            {
                "format": "column",
                "children": [
                    {
                        "format": "row",
                        "children": [
                            {"format": "INVALID_DEEP_WIDGET"},
                        ],
                    }
                ],
            }
        ]
        ok, errors = validate_semantic(config, manifest)
        assert not ok
        assert any("INVALID_DEEP_WIDGET" in e for e in errors)

    def test_conditional_action_type_skipped(self, manifest):
        """Action types with '?' are conditional expressions — should not be validated."""
        config = _make_valid_template()
        config["flows"][0]["onAction"] = [
            {"actionType": "field.value==true ? NAVIGATION : BACK_NAVIGATION", "properties": {}}
        ]
        ok, errors = validate_semantic(config, manifest)
        assert ok, f"Conditional action should be skipped: {errors}"


# ---------------------------------------------------------------------------
# Full validation tests
# ---------------------------------------------------------------------------

class TestFullValidation:
    def test_valid_passes(self, manifest):
        ok, errors = validate_full(
            _make_valid_template(), manifest, STRICT_SCHEMA_PATH
        )
        assert ok, f"Expected valid: {errors}"

    def test_multiple_errors_collected(self, manifest):
        config = {
            "name": "test",
            "flows": [
                {
                    "screenType": "TEMPLATE",
                    "name": "s1",
                    "body": [{"format": "FAKE_WIDGET"}],
                    "initActions": [
                        {"actionType": "FAKE_ACTION", "properties": {}}
                    ],
                }
            ],
        }
        ok, errors = validate_full(config, manifest, STRICT_SCHEMA_PATH)
        assert not ok
        assert len(errors) >= 2  # At least widget + action errors
