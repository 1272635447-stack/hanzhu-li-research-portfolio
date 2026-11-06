# Project 02 — Human–AI Evidence-Evaluation Prototype

This project explores interface support for checking relationships between AI-generated scientific claims and source evidence.

## Three interface conditions

- **A — Source access/search:** readers locate relevant evidence in source material.
- **B — Supplied evidence:** a claim is displayed with a selected evidence passage.
- **C — Evidence plus checking prompts:** the same passage as B is displayed with structured prompts to break down the claim, map claim components to evidence, inspect scope and qualifications, and express uncertainty.

The intended B–C comparison holds the evidence passage constant and varies the checking scaffold.

## Prototype

A local offline HTML prototype supports condition switching, item navigation, response entry, confidence and rationale entry, and CSV export. It does not call a live language model.

## Artifact checks

The project includes documented checks of claim wording consistency, B/C evidence parity, alignment of reference labels, and static prototype properties across 12 items.

## Limitations

No human participants were recruited and no human outcomes were measured. These technical checks concern the consistency of the artifact and do not show that it improves people's judgement, verification behaviour, trust calibration, or learning.

The public release will include only participant-facing and non-sensitive materials. Researcher reference labels will be reviewed separately before any release.
