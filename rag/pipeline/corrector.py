"""
corrector.py

Corrective rewriter — fixes validation errors in generated configs.
"""

import json

from langchain_core.language_models import BaseChatModel

from .manifest import RegistryManifest
from .prompts import build_correction_prompt


def corrective_rewrite(
    config: dict,
    errors: list[str],
    manifest: RegistryManifest,
    llm: BaseChatModel,
) -> dict:
    """Rewrite a config to fix validation errors.

    Args:
        config: The original generated config with errors.
        errors: List of validation error strings.
        manifest: Registry manifest for allowed values.
        llm: Language model for rewriting.

    Returns:
        Corrected config dict.
    """
    prompt = build_correction_prompt(
        manifest=manifest,
        original_config=json.dumps(config, indent=2),
        errors=errors,
    )

    result = llm.invoke(prompt)
    content = result.content.strip()

    # Strip markdown code fences if present
    if content.startswith("```"):
        lines = content.split("\n")
        # Remove first line (```json or ```) and last line (```)
        lines = [l for l in lines if not l.strip().startswith("```")]
        content = "\n".join(lines)

    return json.loads(content)
