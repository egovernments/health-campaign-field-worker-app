"""
validator.py

Two-stage validation: JSON Schema + semantic validation.
All checks are driven by RegistryManifest — no hardcoded allowlists.
"""

import json
from pathlib import Path

import jsonschema

from .manifest import RegistryManifest


def validate_schema(
    config: dict,
    strict_schema_path: str | Path,
) -> tuple[bool, list[str]]:
    """Stage 1: Validate against the auto-generated strict JSON schema."""
    with open(strict_schema_path) as f:
        schema = json.load(f)

    errors = []
    validator = jsonschema.Draft7Validator(schema)
    for error in validator.iter_errors(config):
        path = " > ".join(str(p) for p in error.absolute_path) or "root"
        errors.append(f"[Schema] {path}: {error.message}")

    return len(errors) == 0, errors


def validate_semantic(
    config: dict,
    manifest: RegistryManifest,
) -> tuple[bool, list[str]]:
    """Stage 2: Semantic validation against dynamically-extracted registry values."""
    errors = []

    allowed_formats = manifest.all_widget_formats
    allowed_actions = manifest.action_types
    allowed_form_formats = manifest.form_formats
    allowed_entities = manifest.entity_models

    for screen in config.get("flows", []):
        screen_name = screen.get("name", "<unnamed>")

        # Check screen type
        screen_type = screen.get("screenType")
        if screen_type not in ("TEMPLATE", "FORM"):
            errors.append(
                f"[{screen_name}] Invalid screenType: '{screen_type}'. "
                f"Must be TEMPLATE or FORM."
            )

        # Check widget formats in header/body/footer
        for section in ("header", "body", "footer"):
            for widget in screen.get(section, []):
                _check_widget(widget, errors, allowed_formats, screen_name)

        # Check action types in initActions and onAction
        for action in screen.get("initActions", []):
            _check_action(action, errors, allowed_actions, screen_name)
        for action in screen.get("onAction", []):
            _check_action(action, errors, allowed_actions, screen_name)

        # Check FORM page field formats
        for page in screen.get("pages", []):
            page_name = page.get("page", "<unnamed page>")
            for prop in page.get("properties", []):
                fmt = prop.get("format")
                if fmt and fmt not in allowed_form_formats:
                    errors.append(
                        f"[{screen_name}/{page_name}] Unknown form format: "
                        f"'{fmt}'. Valid: {sorted(allowed_form_formats)}"
                    )

        # Check entity references in wrapperConfig
        wrapper = screen.get("wrapperConfig")
        if isinstance(wrapper, dict):
            root_entity = wrapper.get("rootEntity")
            if root_entity and root_entity not in allowed_entities:
                errors.append(
                    f"[{screen_name}] Unknown rootEntity: '{root_entity}'. "
                    f"Valid: {sorted(allowed_entities)}"
                )
            for rel in wrapper.get("relations", []):
                rel_entity = rel.get("entity")
                if rel_entity and rel_entity not in allowed_entities:
                    errors.append(
                        f"[{screen_name}] Unknown relation entity: "
                        f"'{rel_entity}'. Valid: {sorted(allowed_entities)}"
                    )

    return len(errors) == 0, errors


def _check_widget(
    widget: dict,
    errors: list[str],
    allowed_formats: set[str],
    screen_name: str,
) -> None:
    """Recursively validate widget formats in nested children."""
    fmt = widget.get("format")
    if fmt and fmt not in allowed_formats:
        errors.append(
            f"[{screen_name}] Unknown widget format: '{fmt}'. "
            f"Valid: {sorted(allowed_formats)}"
        )

    # Check actions within the widget
    for action in widget.get("onAction", []):
        if isinstance(action, dict):
            _check_action(action, errors, set(), screen_name)

    # Recurse into children
    for child in widget.get("children", []):
        if isinstance(child, dict):
            _check_widget(child, errors, allowed_formats, screen_name)

    # Check single child
    child = widget.get("child")
    if isinstance(child, dict):
        _check_widget(child, errors, allowed_formats, screen_name)


def _check_action(
    action: dict,
    errors: list[str],
    allowed_actions: set[str],
    screen_name: str,
) -> None:
    """Recursively validate action types including nested actions."""
    action_type = action.get("actionType")
    if action_type and allowed_actions:
        # Skip conditional action type expressions (contain '?')
        if "?" not in str(action_type) and action_type not in allowed_actions:
            errors.append(
                f"[{screen_name}] Unknown actionType: '{action_type}'. "
                f"Valid: {sorted(allowed_actions)}"
            )

    # Recurse into nested actions
    for nested in action.get("actions", []):
        if isinstance(nested, dict):
            _check_action(nested, errors, allowed_actions, screen_name)


def validate_full(
    config: dict,
    manifest: RegistryManifest,
    strict_schema_path: str | Path,
) -> tuple[bool, list[str]]:
    """Run both validation stages and return combined results."""
    schema_ok, schema_errors = validate_schema(config, strict_schema_path)
    semantic_ok, semantic_errors = validate_semantic(config, manifest)

    all_errors = schema_errors + semantic_errors
    return len(all_errors) == 0, all_errors
