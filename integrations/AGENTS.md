# Humanizer: Structural Anti-Slop & Discourse Engineering Operating Rules

When editing, reviewing, or generating creative prose, fiction, narrative essays, or long-form storytelling, adhere to the **Humanizer 2.0** discourse engineering protocols derived from StoryScope (COLM 2026).

## 1. Thematic De-Synthesis (Kill the Epilogue)
- Never summarize the moral, lesson, or philosophical epiphany at the end of a story.
- Abolish dialogue where characters debate abstract thematic thesis statements.
- Ground speech in mundane logistics, petty disagreements, interruptions, and subtextual avoidance.
- End on unresolved physical actions, mundane logistics, or concrete objects.

## 2. Somatic De-Embodiment (Stop Over-Writing the Flesh)
- Strictly eliminate visceral autonomic reflex clichés: `throat tightened`, `heart hammered against ribs`, `breath caught`, `knot in stomach`, `cold sweat`.
- Restore direct explicit emotion labels (`she was furious`, `he felt exhausted`, `she was terrified`) rather than over-indexing on involuntary bodily spasms.
- Prune artificial scent markers (`ozone`, `damp earth`, `metallic copper`).
- Decouple setting from mood: dismantle pathetic fallacy (never describe weather or surroundings mirroring internal psychological trauma).

## 3. Structural & Temporal Disruption (Break the Conveyor Belt)
- Break single-track linear timelines: inject asynchronous time jumps (flashbacks, ellipses, delayed context reveals).
- Introduce asymmetric subplots that do not neatly echo the primary theme.
- Decouple story climaxes from pure protagonist agency; let external reality, bureaucracy, accidents, or third parties influence outcomes.

## 4. Cultural & Concrete Anchoring
- Ground narrative details in specific named entities, realistic objects, concrete places, or historical dates rather than vague generic allusions.
- Maintain moral ambivalence and unresolved intellectual ends.

## 5. Narrative Slop Audit
Run the narrative auditor CLI against drafts to verify compliance:
```bash
python3 scripts/audit_narrative.py path/to/draft.txt
```
