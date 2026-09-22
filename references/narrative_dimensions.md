# The 10 NarraBench Dimensions & Literary Theory Grounding

The *StoryScope* pipeline (Russell et al., COLM 2026) grounds its narrative feature discovery in the **NarraBench taxonomy** (Hamilton, Wilkens, & Piper, 2025), consolidating decades of formal narratological theory (most notably Gérard Genette's *Narrative Discourse*, 1980, and Yufei Tian et al., 2024).

This document details the 10 core dimensions evaluated across the 61,608-story corpus and provides the theoretical context for why AI models converge on a narrow, shared region of narrative space while human stories exhibit radical dispersion.

---

## 1. NarraBench Narrative Dimensions

### 1. `AGENT` (Characters & Agency)
- **Theoretical Basis**: Character introduction modes, character complexity, agency distributions, and emotional expression typologies.
- **AI Failure Mode**: Introduces characters by reciting visual appearance (*"external description"*, 52% AI vs 30% Human). Expresses emotions almost exclusively through somatic reflex metaphors (*"throat tightened"*, *"heart hammered"*, 81% AI vs 38% Human).
- **Human Grounding**: Introduces characters in-dialogue (21.4 uniqueness ratio) or mid-action. Uses explicit emotional naming (29% vs 8%) and complex, unstated interior motivations.

### 2. `SOC` (Social Networks & Topology)
- **Theoretical Basis**: Relational topologies, dyadic vs. group scene mechanics, gossip/rumor dynamics, and community salience.
- **AI Failure Mode**: High reliance on isolated dyadic conversations. Models like GPT-5.4 disproportionately over-index on village gossip/rumors as a mechanical plot driver (64% GPT vs 44% others).
- **Human Grounding**: Organic, messy community structures where secondary characters pursue their own independent agendas rather than existing solely to assist or oppose the protagonist.

### 3. `EVT` (Events & Causality)
- **Theoretical Basis**: Beat-level causal sequences, schema types (quest, heist, ordeal, slice-of-life), and causal continuity.
- **AI Failure Mode**: Hyper-continuous, single-track causal chains (`4.20` AI vs `3.92` Human). Every scene is a neat, predictable consequence of the previous one. AI resolutions default to protagonist choice (69% AI vs 46% Human) and neat internal emotional acceptance (47% vs 27%).
- **Human Grounding**: Causal asymmetry. Life intervenes through accidental discoveries, external fate, bureaucratic delay, and tangential disruptions.

### 4. `PLT` (Plot & Conflict)
- **Theoretical Basis**: Core obstacles, dramatic arcs, subplot integration, and moral trajectory.
- **AI Failure Mode**: **79% of AI stories contain ZERO subplots** (vs 57% for humans). Protagonists are framed with moral clarity (clearly positive or tragic), avoiding real ethical ambivalence (only 38% AI vs 59% Human).
- **Human Grounding**: Parallel or contrasting subplots (42% Human vs 21% AI) that offer relief or complicate the main moral arc without echoing it like a sermon.

### 5. `SET` (Setting & Environment)
- **Theoretical Basis**: Spatial granularity, multi-locale scope, sensory modalities, and environmental interaction.
- **AI Failure Mode**: Heavy reliance on pathetic fallacy (setting mirrors character psychology at `4.07` vs `3.58`). Compulsive olfactory/smell descriptions (82% AI vs 57% Human). Static, single-locale focus (`1.08` AI vs `1.34` Human).
- **Human Grounding**: Emotional indifference of the physical world. Expansive multi-locale variety. Sensory balance across spatial geometry, temperature, physical fatigue, and sound over constant olfactory cues.

### 6. `TMP` (Time & Temporality)
- **Theoretical Basis**: Gérard Genette’s tripartite temporal model:
  - *Order*: Chronological vs. anachronic (analepsis / flashbacks, prolepsis / flashforwards).
  - *Duration*: Scene, summary, ellipsis (time jumps), and pause.
  - *Frequency*: Singulative (narrating once what happened once) vs. iterative (narrating once what happened frequently).
- **AI Failure Mode**: Rigid, forward-marching chronological timelines (`2.12` AI vs `2.40` Human). Rare use of ellipses or true temporal fragmentation (`1.68` vs `1.96`).
- **Human Grounding**: High anachrony intensity (`2.58` Human vs `2.31` AI). Stories start years later, jump across decades, or use memory to stage asynchronous revelations.

### 7. `REV` (Revelation & Discourse)
- **Theoretical Basis**: Suspense vs. curiosity gaps, withheld causal antecedents, and recontextualization depth.
- **AI Failure Mode**: Transparent staging where clues lead directly to expected twists.
- **Human Grounding**: **Depth of Recontextualization After Surprise (`3.28` Human vs `2.95` AI)**. In human writing, a revelation forces the reader to rethink and re-interpret earlier scenes from the ground up, rather than just delivering a momentary shock.

### 8. `PER` (Perspective & Narration)
- **Theoretical Basis**: Narrative voice, point of view (1st, 2nd, 3rd limited/omniscient), focalization breadth, and direct speech balance.
- **AI Failure Mode**: Monotonous, neutral third-person limited stance that acts like an objective camera with microscopic access to character internal thoughts (`3.93` AI vs `3.67` Human). Dialogue hijacked for philosophical debate (59% vs 34%).
- **Human Grounding**: Higher proportion of direct dialogue (`2.95` vs `2.70`), colloquial friction, idiosyncratic speech rhythms, and distinct narratorial persona.

### 9. `SIT` (Situatedness & Audience)
- **Theoretical Basis**: Thematic explicitness, moralizing, narratorial intervention, intertextual reference strategies, and reader relationship.
- **AI Failure Mode**: High thematic explicitness & moralizing (`3.94` AI vs `3.28` Human). Narrator explicitly delivers the moral takeaway (`77%` AI vs `52%` Human). Vague implicit allusions (`72%` AI vs `50%` Human). Sterile fourth-wall containment (`0.39` AI vs `0.67` Human).
- **Human Grounding**: Named intertextual references to real books, authors, and historical events (`47%` Human vs `24%` AI). Direct reader address (`0.28` Human vs `0.07` AI — 4x higher!). Unapologetic refusal to explain the moral of the story.

### 10. `STR` (Macroscopic Structure)
- **Theoretical Basis**: Global narrative architectures (framed recollections, epistolary forms, parallel vignettes, cyclical structures).
- **AI Failure Mode**: Formulaic 3-act / hero's journey arcs with tidy, symmetric resolutions.
- **Human Grounding**: Structural irregularity, open endings, framed confessions, fragmented vignettes, and asymmetrical cadences.

---

## 2. The AI Convergence Theorem

Why do all major LLMs cluster into a tiny corner of narrative feature space?

```text
       Narrative Feature Space (d = 304)
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│         [Human Story A]                                     │
│                                      [Human Story B]        │
│                                                             │
│                      ▲                                      │
│                      │ 1.6x Centroid Distance               │
│                      ▼                                      │
│             ┌─────────────────┐                             │
│             │  AI CLUSTER     │                             │
│             │  • Claude       │    [Human Story C]          │
│             │  • GPT          │                             │
│             │  • Gemini       │                             │
│             │  • DeepSeek     │                             │
│             │  • Kimi         │                             │
│             └─────────────────┘                             │
│                                                             │
│         [Human Story D]                                     │
│                                      [Human Story E]        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

1. **Mean Human-AI Centroid Distance**: **1.6× greater** than the mean AI-AI centroid distance (`6.6` vs `4.3`).
2. **Separation**: The closest human-AI centroid pair is farther apart (`6.2`) than the most distant AI-AI pair (`6.0`).
3. **Dispersion / Variance**: The human dispersion radius is **22% greater** than the AI cluster radius (`33.2` vs `27.4`).

**Conclusion**: Large language models trained on massive text corpora suffer from an "artificial hivemind" (Jiang et al., 2025; Reinhart et al., 2025). When tasked with storytelling, they collapse onto the safest, most median narrative conventions. **Humanizer 2.0 works by deliberately steering generation out of this synthetic gravity well toward the high-dispersion, high-rarity frontier of human narrative discourse.**
