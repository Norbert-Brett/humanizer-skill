---
name: humanizer-2.0
description: >-
  Eliminate structural AI writing slop and transform synthetic text into genuine human-like narrative discourse using empirical findings from StoryScope (COLM 2026). Use whenever writing, editing, or evaluating fiction, creative non-fiction, storytelling, or long-form prose to eliminate AI slop, bypass discourse-level AI detection, break causal hyper-linearity, stop embodied emotional clichés, and avoid thematic moralizing.
---

# Humanizer 2.0: Structural Anti-Slop & Discourse Engineering

Based on the empirical discoveries of ***StoryScope: Investigating idiosyncrasies in AI fiction*** (Russell et al., COLM 2026), **Humanizer 2.0** discards obsolete lexical cosmetic tricks (Humanizer 1.0) and fixes the underlying discourse architecture that makes AI writing instantly recognizable.

---

## The Paradigm Shift: Why Humanizer 1.0 Failed

Traditional "AI Humanizers" (Humanizer 1.0) only perform surface-level cosmetic edits:
- Replacing telltale buzzwords (*delve*, *tapestry*, *testament*, *beacon*, *unfurl*).
- Stripping em-dashes and semicolons.
- Jiggling sentence lengths or injecting artificial typos.

> [!CAUTION]
> **The StoryScope Proof (93.9% Detectability)**:
> The StoryScope paper demonstrated that when AI stories undergo span-level stylistic editing via professional human rewrites (the LAMP framework), **detection dropped by a negligible 1.6% (from 95.5% to 93.9% F1)**. 
> 
> Even with 100% of surface stylistic cues wiped clean, classifiers trained purely on **narrative and discourse structure** achieve **93.2% Macro-F1** accuracy. AI text is exposed not by *how* words are phrased, but by *how the narrative is constructed*.

---

## The 3 Pillars of AI Slop

StoryScope featurized 61,608 stories across 10 NarraBench dimensions and 304 narrative features, isolating the exact statistical deviations where LLMs systematically betray themselves:

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                           THE 3 AI SLOP SYNDROMES                           │
├─────────────────────────┬─────────────────────────┬─────────────────────────┤
│  1. THEMATIC OVER-      │  2. SENSORY & EMBODIED  │  3. CAUSAL HYPER-       │
│     DETERMINATION       │     PERFORMATIVITY      │     LINEARITY           │
├─────────────────────────┼─────────────────────────┼─────────────────────────┤
│ • Narrator sermonizing  │ • Visceral cliché reflex│ • Single-track conveyor │
│   the moral at the end  │   (throat tight, chest  │   belt from A to Z      │
│   (77% AI vs 52% Human) │   tight, breath caught) │ • 79% AI stories have   │
│ • Dialogue turned into  │ • Embodied emotion:     │   NO subplots (vs 57%)  │
│   philosophical debate  │   81% AI vs 38% Human   │ • Protagonist solves all│
│   (59% AI vs 34% Human) │ • Compulsive olfactory  │   by neat agency / inner│
│ • Compulsive thematic   │   smell tags (82% vs 57%)│  acceptance (47% vs 27%)│
│   cohesion; no loose    │ • Pathetic fallacy:     │ • Linear timeline; no   │
│   intellectual ends     │   setting mirrors mood  │   real anachrony/jumps  │
└─────────────────────────┴─────────────────────────┴─────────────────────────┘
```

---

## The 4-Phase Humanizer 2.0 Transformation Pipeline

Whenever generating new narrative prose or rewriting AI-generated drafts, execute this 4-phase transformation:

```mermaid
flowchart LR
    A[Raw AI Draft] --> B[Phase 1: Thematic De-Synthesis]
    B --> C[Phase 2: Somatic De-Embodiment]
    C --> D[Phase 3: Structural Disruption]
    D --> E[Phase 4: Cultural Anchoring]
    E --> F[Humanized 2.0 Output]
```

### Phase 1: Thematic De-Synthesis (Kill the Moral)
1. **Delete Narrator Wrap-Ups**: Strip any closing reflection where the narrator summarizes the lesson, philosophical insight, or moral growth. End on an unresolved image, a concrete action, or a mundane interruption.
2. **De-philosophize Dialogue**: Characters must not sound like ethics professors debating universal truths. Replace grand thematic exchanges with petty disagreements, misunderstandings, logistical banter, or subtextual avoidance.
3. **Embrace Ambiguity**: Human stories have a 59% rate of moral ambivalence in protagonist actions (vs 38% for AI). Do not justify or neatly redeem questionable actions.

### Phase 2: Somatic De-Embodiment (Stop Over-Writing the Flesh)
1. **Abolish Autonomic Reflex Clichés**: Strictly purge:
   - *"His throat tightened / closed up"*
   - *"Her heart hammered against her ribs / skipped a beat"*
   - *"A cold sweat broke out across his neck"*
   - *"Her breath caught in her chest"*
   - *"A knot formed in the pit of her stomach"*
2. **Restore Direct Emotion Labeling**: Humans use explicit emotion labels (*"she was angry"*, *"he felt exhausted"*, *"she was terrified"*) 29% of the time vs. only 8% for AI. Counteract the misguided creative writing dogma of "show don't tell" when it devolves into involuntary physiological spasms.
3. **Cut Compulsive Olfactory/Smell Metaphors**: Cut down artificial smell markers (*damp earth, ozone, copper, stale smoke, bitter almond*).
4. **Decouple Setting from Psychology**: Stop pathetic fallacy (rain weeping for a sorrowful character, flickering lights reflecting panic). Let the environment be indifferent or ironically mismatched (a brutal argument on a gorgeous, sunlit patio).

### Phase 3: Structural & Temporal Disruption (Break the Conveyor Belt)
1. **Inject Asymmetric Subplots**: Introduce a secondary conflict or B-plot that does *not* neatly echo the main theme (human stories feature contrasting or parallel subplots at 42% vs 21% for AI).
2. **Employ Anachrony & Chronological Discontinuity**:
   - Do not narrate strictly from inciting incident to resolution.
   - Jump in time (ellipses). Open after the catastrophe and backtrack, or interleave two distant time horizons.
3. **Stage Deep Recontextualization**: Ensure revelations force the reader to re-evaluate prior occurrences rather than simply providing a predictable twist.
4. **Decouple Resolution from Protagonist Agency**: Let external fate, institutional inertia, unpreventable accidents, or another character's independent choice resolve or complicate the climax (only 46% of human resolutions are pure protagonist choice, vs 69% for AI).

### Phase 4: Cultural Anchoring & Voice Posture (Enter the Real World)
1. **Ground in Named Entities**: AI sticks to vague universal allusions (72% implicit echoes). Human writing incorporates explicit named texts, real authors, specific brands, historical events, and real-world lore (47% vs 24%).
2. **Permeate the Fourth Wall & Reader Stance**: Acknowledge the reader or adopt a distinct authorial presence (0.67 permeability for humans vs 0.39 for AI; direct reader address is 4x higher in human writing).
3. **Vary Dialogue-to-Narration Ratio**: Increase dynamic, interrupted dialogue (humans score 2.95 vs 2.70 for AI). Let spoken lines carry narrative velocity.

---

## Quick Reference: The Core 30 Feature Rules of Thumb

When writing or editing, check your work against these specific statistical gaps from Table 16 of the paper:

| Narrative Dimension | AI Slop Traps to Avoid (AI Elevated) | Human Techniques to Inject (Human Elevated) |
| :--- | :--- | :--- |
| **Situatedness (SIT)** | • Thematic explicitness & moralizing (`3.94` AI vs `3.28` Human)<br>• Narrator thematic commentary (`77%` AI vs `52%` Human)<br>• Vague implicit echoes (`72%` AI vs `50%` Human) | • Explicit named intertextual references (`47%` Human vs `24%` AI)<br>• Direct reader address (`0.28` Human vs `0.07` AI)<br>• Fourth-wall permeability (`0.67` Human vs `0.39` AI) |
| **Agent & Emotion (AGENT)** | • Embodied metaphors for emotion (`81%` AI vs `38%` Human)<br>• External character appearance intro (`52%` AI vs `30%` Human) | • Direct explicit emotion naming (`29%` Human vs `8%` AI)<br>• Character introduction in dialogue or sudden action |
| **Setting (SET)** | • Setting as psychological mirror (`4.07` AI vs `3.58` Human)<br>• Olfactory / smell modality obsession (`82%` AI vs `57%` Human)<br>• Sensory over-density (`3.93` AI vs `3.66` Human) | • Multi-locale variety (`1.34` Human vs `1.08` AI)<br>• Emotionally neutral or ironic environment |
| **Plot & Event (PLT/EVT)**| • Single causal continuity chain (`4.20` AI vs `3.92` Human)<br>• Protagonist-only agency resolution (`69%` AI vs `46%` Human)<br>• No subplots (`79%` AI vs `57%` Human)<br>• Tidy internal acceptance (`47%` AI vs `27%` Human) | • Thematically parallel/contrasting subplots (`42%` Human vs `21%` AI)<br>• Moral ambivalence in choices (`59%` Human vs `38%` AI)<br>• Unresolved or external resolutions |
| **Time & Revelations (TMP/REV)** | • Single linear timeline<br>• Flat revelation sequence | • Chronological discontinuity (`2.40` Human vs `2.12` AI)<br>• Flashbacks / Anachrony intensity (`2.58` Human vs `2.31` AI)<br>• Recontextualization after surprise (`3.28` Human vs `2.95` AI) |

---

## Model Fingerprint Neutralization

Check [references/model_fingerprints.md](./references/model_fingerprints.md) when working with specific LLM backends:

- **Claude**: Neutralize flat event escalation, reverent continuism, and compulsive quiet epilogues.
- **GPT**: Purge gossip/rumor plot engines, distant retrospective framing, and fake-subversive twists.
- **Gemini**: Dismantle bleak/oppressive setting defaults (88% prevalence!) and extended neat denouements.
- **DeepSeek**: Fix upfront context dumping, over-indexed physical gestures, and embedded storytelling traps.
- **Kimi**: Avoid predictable in-medias-res formulas and generic archetype drift.

---

## Detailed Documentation & Tools

- [The 30 Core Features Matrix](./references/core_features_matrix.md) — Exact statistical distributions, SHAP weights, and definitions.
- [AI Slop Syndromes & Antidotes](./references/slop_syndromes.md) — Deep-dive pathology guide for writers and editors.
- [Model Fingerprint Guide](./references/model_fingerprints.md) — Tailored countermeasures for each major frontier LLM.
- [Transformation Playbook](./references/transformation_playbook.md) — Concrete rewrite patterns and structural engineering templates.
- [Comparative Case Study](./examples/before_after_case_study.md) — Side-by-side demonstration of Raw AI vs Humanizer 1.0 vs Humanizer 2.0.
- [Narrative Audit Script](./scripts/audit_narrative.py) — Python CLI tool to inspect texts against StoryScope markers.
