"""
test_introspector.py

Tests for registry_introspector.py — validates extraction from Dart sources.
Run: python -m pytest rag/tests/test_introspector.py -v
"""

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent.parent))
from registry_introspector import build_manifest


REPO_ROOT = str(Path(__file__).resolve().parent.parent.parent)


@pytest.fixture(scope="module")
def manifest():
    return build_manifest(REPO_ROOT)


class TestWidgetFormats:
    def test_count(self, manifest):
        assert manifest["template_widget_formats"]["count"] == 26

    def test_no_duplicates(self, manifest):
        names = manifest["template_widget_formats"]["all_format_names"]
        assert len(names) == len(set(names))

    def test_text_template_captured(self, manifest):
        """textTemplate is defined across two lines — regex must handle this."""
        names = manifest["template_widget_formats"]["all_format_names"]
        assert "textTemplate" in names

    def test_known_formats_present(self, manifest):
        names = set(manifest["template_widget_formats"]["all_format_names"])
        expected = {
            "button", "card", "listView", "searchBar", "menu_card",
            "panelCard", "backLink", "proximitySearch", "actionPopup",
            "textTemplate", "row", "column", "tag", "infoCard",
        }
        assert expected.issubset(names)

    def test_widget_detail_has_properties(self, manifest):
        for widget in manifest["template_widget_formats"]["items"]:
            assert "format" in widget
            assert "class" in widget
            assert "source_file" in widget
            assert "json_properties_read" in widget


class TestActionTypes:
    def test_count(self, manifest):
        assert manifest["action_types"]["count"] == 12

    def test_known_actions_present(self, manifest):
        names = set(manifest["action_types"]["all_action_names"])
        expected = {
            "NAVIGATION", "BACK_NAVIGATION", "CREATE_EVENT",
            "UPDATE_EVENT", "SEARCH_EVENT", "REFRESH_SEARCH",
            "FETCH_TRANSFORMER_CONFIG", "SHOW_TOAST", "CLEAR_STATE",
            "OPEN_SCANNER", "REVERSE_TRANSFORM", "CLOSE_POPUP",
        }
        assert names == expected


class TestFormFormats:
    def test_count(self, manifest):
        assert manifest["form_field_formats"]["count"] == 15

    def test_known_formats(self, manifest):
        formats = set(manifest["form_field_formats"]["items"])
        expected = {
            "date", "latLng", "custom", "locality", "select", "numeric",
            "dropdown", "checkbox", "radio", "dob", "scanner",
            "idPopulator", "mobileNumber", "textArea", "text",
        }
        assert formats == expected


class TestFormTypes:
    def test_count(self, manifest):
        assert manifest["form_field_types"]["count"] == 5

    def test_known_types(self, manifest):
        types = set(manifest["form_field_types"]["items"])
        expected = {"object", "string", "integer", "boolean", "dynamic"}
        assert types == expected


class TestEntityModels:
    def test_nonzero_count(self, manifest):
        assert manifest["entity_models"]["count"] > 0

    def test_no_search_models(self, manifest):
        for model in manifest["entity_models"]["all_model_names"]:
            assert "SearchModel" not in model

    def test_no_companion_models(self, manifest):
        for model in manifest["entity_models"]["all_model_names"]:
            assert "Companion" not in model

    def test_known_entities_present(self, manifest):
        names = set(manifest["entity_models"]["all_model_names"])
        # These are commonly referenced in sample configs
        for expected in ["HouseholdModel", "IndividualModel", "FacilityModel"]:
            assert expected in names, f"{expected} not found in entity models"


class TestTransformerConfigs:
    def test_nonzero_count(self, manifest):
        assert manifest["transformer_configs"]["count"] > 0

    def test_known_configs_present(self, manifest):
        configs = set(manifest["transformer_configs"]["items"])
        assert "beneficiaryRegistration" in configs


class TestManifestStructure:
    def test_meta_present(self, manifest):
        assert "_meta" in manifest
        assert manifest["_meta"]["source"] == "registry_introspector.py"

    def test_all_sections_present(self, manifest):
        expected_keys = {
            "_meta",
            "template_widget_formats",
            "action_types",
            "form_field_formats",
            "form_field_types",
            "entity_models",
            "transformer_configs",
            "custom_components",
        }
        assert set(manifest.keys()) == expected_keys

    def test_serializable_to_json(self, manifest):
        """Ensure the manifest can be serialized without errors."""
        json_str = json.dumps(manifest, indent=2)
        roundtrip = json.loads(json_str)
        assert roundtrip["template_widget_formats"]["count"] == manifest["template_widget_formats"]["count"]
