"""
manifest.py

RegistryManifest — single source of truth for all allowed config values.
Loaded from registry_manifest.json produced by registry_introspector.py.
"""

import json
from pathlib import Path


class RegistryManifest:
    """Loads and provides access to the registry manifest.

    All allowed widget formats, action types, entity models, etc.
    are read from this manifest — never hardcoded.
    """

    def __init__(self, manifest_path: str | Path):
        with open(manifest_path) as f:
            self._data = json.load(f)

    @property
    def widget_formats(self) -> set[str]:
        return set(self._data["template_widget_formats"]["all_format_names"])

    @property
    def action_types(self) -> set[str]:
        return set(self._data["action_types"]["all_action_names"])

    @property
    def form_formats(self) -> set[str]:
        return set(self._data["form_field_formats"]["items"])

    @property
    def form_types(self) -> set[str]:
        return set(self._data["form_field_types"]["items"])

    @property
    def entity_models(self) -> set[str]:
        return set(self._data["entity_models"]["all_model_names"])

    @property
    def transformer_configs(self) -> set[str]:
        return set(self._data["transformer_configs"]["items"])

    @property
    def custom_components(self) -> set[str]:
        return set(self._data["custom_components"]["items"])

    @property
    def all_widget_formats(self) -> set[str]:
        """Template widget formats + custom components (both valid in configs)."""
        return self.widget_formats | self.custom_components

    def widget_detail(self, format_name: str) -> dict | None:
        """Get full widget metadata (json properties, supports_children, etc.)."""
        for w in self._data["template_widget_formats"]["items"]:
            if w["format"] == format_name:
                return w
        return None

    def action_detail(self, action_type: str) -> dict | None:
        """Get full action metadata (executor class, source file)."""
        for a in self._data["action_types"]["items"]:
            if a["action_type"] == action_type:
                return a
        return None

    def summary(self) -> dict:
        """Return a summary of the manifest contents."""
        return {
            "widget_formats": len(self.widget_formats),
            "custom_components": len(self.custom_components),
            "all_widget_formats": len(self.all_widget_formats),
            "action_types": len(self.action_types),
            "form_formats": len(self.form_formats),
            "form_types": len(self.form_types),
            "entity_models": len(self.entity_models),
            "transformer_configs": len(self.transformer_configs),
        }
