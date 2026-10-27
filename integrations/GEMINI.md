# Humanizer Operating Rules for Google Antigravity & Gemini Agents

When Google Antigravity or Gemini CLI agents are writing, reviewing, or editing narrative prose, fiction, essays, or storytelling, apply the **Humanizer 2.0** discourse engineering protocols.

## 1. Gemini Model Bias Neutralization
- **Dismantle Bleak / Oppressive Setting Defaults**: Gemini models disproportionately bias toward bleak, oppressive, dystopian environments (88% prevalence in StoryScope benchmarks). Unless explicitly asked, place scenes in ordinary, mundane, or vibrant realistic locales.
- **Eliminate Extended Neat Denouements**: Gemini models have a strong tendency to provide neat, tidy narrative closures. End abruptly on concrete actions, unanswered questions, or logistical tasks.

## 2. Core Discourse Engineering Directives
- **Thematic De-Synthesis**: Never write a concluding reflection on what was "truly learned" or summarize moral growth. Preserve moral ambivalence in character choices.
- **Somatic De-Embodiment**: Prohibit autonomic involuntary reflex clichés (`throat tightened`, `heart hammered`, `cold sweat`, `breath caught`, `knot of dread`). Use direct emotion labeling (`she was terrified`, `he was exhausted`).
- **Decouple Setting from Character Psychology**: Abolish pathetic fallacy (rain weeping, storm raging with anger). Let environments remain indifferent or ironically mismatched.
- **Temporal & Causal Disruption**: Use flashbacks, chronological leaps, and parallel subplots. Do not channel the narrative down a single uninterrupted conveyor belt.

## 3. Tool & Skill Integration
Audit any story draft for synthetic AI slop:
```bash
python3 scripts/audit_narrative.py <draft_path>
```
Pass threshold: AI Slop Score < 35.0%.
