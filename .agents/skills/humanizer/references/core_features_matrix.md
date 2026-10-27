# The StoryScope 30 Core Features Matrix

This reference compiles the 30 core discriminative narrative features discovered by the **StoryScope** pipeline (Russell et al., COLM 2026), evaluated over 61,608 stories across 10,272 prompts.

In the paper's experiments, these **30 core features alone achieved 84.8% Macro-F1 (0.828 AUPRC)** on human vs. AI classification—capturing over 91% of the performance of the full 257-feature narrative model without a single lexical or stylistic cue.

---

## 1. Complete Core Features Table

Data compiled from Table 14 (AI-elevated), Table 15 (Human-elevated), and Table 16 (Full quantitative comparisons):

- **Types**: `scale` = 1–5 Likert, `ord` = ordinal scale (mean over integer codes), `cat` = categorical, `binary` = yes/no, `multi` = multi-select.
- **Values**: Continuous metrics show mean values; categorical/binary options show % prevalence in corpus.
- **Gap**: `Human − AI`. A negative gap indicates the feature is elevated in AI writing; a positive gap indicates elevation in human writing.

| # | Dimension | Feature Name & Target Value | Type | Question / Definition | Human Mean | AI Mean | Gap (H − AI) |
|---|:---|:---|:---:|:---|:---:|:---:|:---:|
| **AI-Elevated: Thematic Over-Determination** |
| 1 | `SIT` | Thematic Explicitness & Moralizing | `scale` | How explicitly does the story articulate its themes or morals? | 3.28 | 3.94 | **−0.65** |
| 2 | `SIT` | Moral / Philosophical Weighting | `scale` | How heavily does the story foreground moral or philosophical questions? | 3.26 | 3.68 | **−0.42** |
| 3 | `PLT` | Thematic Unity | `scale` | To what extent do subplots and flourishes serve a central thematic concern? | 4.41 | 4.74 | **−0.33** |
| 4 | `SIT` | Narratorial Thematic Commentary → `yes` | `binary` | Does the narrator explicitly comment on themes beyond characters' perspectives? | 52% | 77% | **−25%** |
| 5 | `PER` | Dialogue Function → `philosophical debate` | `multi` | What main functions does dialogue serve? (Elevated for philosophical sparring) | 34% | 59% | **−25%** |
| 6 | `SIT` | Reference Explicitness → `implicit echoes` | `cat` | Are intertextual gestures primarily explicit or diffuse? (Elevated for vague generic echoes) | 50% | 72% | **−22%** |
| **AI-Elevated: Sensory & Embodied Performativity** |
| 7 | `AGENT` | Emotional Expression → `embodied` | `cat` | How are characters' emotions most commonly conveyed? (Embodied somatic metaphors) | 38% | 81% | **−43%** |
| 8 | `SET` | Setting as Psychological Mirror | `scale` | To what degree does physical environment mirror characters' inner states? | 3.58 | 4.07 | **−0.49** |
| 9 | `SET` | Environmental & Ecological Emphasis | `scale` | How prominent is the natural environment or ecology in the narrative? | 2.83 | 3.21 | **−0.38** |
| 10 | `SET` | Dominant Sensory Modalities → `olfactory` | `multi` | Which sensory modalities does the story engage? (Overuse of smell imagery) | 57% | 82% | **−25%** |
| 11 | `SET` | Sensory Density | `scale` | How dense is sensory description across the narrative? (minimal to lush) | 3.66 | 3.93 | **−0.27** |
| 12 | `PER` | Depth of Interior Access | `scale` | How deep into characters' inner mental life does narration go? | 3.67 | 3.93 | **−0.26** |
| **AI-Elevated: Structural Streamlining** |
| 13 | `EVT` | Continuity of Main Causal Chain | `scale` | How continuous is the single causal chain from inciting incident to ending? | 3.92 | 4.20 | **−0.28** |
| 14 | `SET` | Spatial Granularity Level | `ord` | How fine-grained is the story's depiction of physical space? | 2.27 | 2.53 | **−0.26** |
| 15 | `PLT` | Agency in Resolution → `protagonist choice` | `cat` | Is resolution driven by protagonist's choices or external events? | 46% | 69% | **−23%** |
| 16 | `AGENT` | Character Introduction → `external description` | `cat` | What narrative device primarily introduces the central character? (Appearance) | 30% | 52% | **−22%** |
| 17 | `PLT` | Subplot Integration → `no subplots` | `cat` | How directly do subplots echo the central theme? (Prevalence of zero subplots) | 57% | 79% | **−22%** |
| 18 | `EVT` | Mode of Resolution → `internal understanding` | `cat` | Is the main event chain resolved through internal acceptance or external action? | 27% | 47% | **−20%** |
| 19 | `SET` | Opening Spatial Grounding | `ord` | How clearly does the opening ground the reader in a specific physical setting? | 2.12 | 2.33 | **−0.21** |
| 20 | `REV` | Pre-Threat Character Investment | `scale` | How much does the story build investment before major jeopardy? | 2.76 | 2.99 | **−0.23** |
| **Human-Elevated: Intertextual Richness & Cultural Specificity** |
| 21 | `SIT` | Intertextual Strategy Types → `explicit named reference` | `multi` | What kinds of intertextual engagement does the story employ? (Real authors/works) | 47% | 24% | **+23%** |
| 22 | `SIT` | Reference Explicitness → `balanced mix` | `cat` | Are intertextual gestures explicit or diffuse? (Mix of explicit and nuanced) | 37% | 16% | **+21%** |
| **Human-Elevated: Reader Engagement & Fourth-Wall Permeability** |
| 23 | `SIT` | Fourth-Wall Permeability | `ord` | To what extent does the story break the boundary between story-world and reader? | 0.67 | 0.39 | **+0.28** |
| 24 | `PER` | Direct Reader Address | `ord` | How often does the text directly address the reader? (e.g., 'dear reader') | 0.28 | 0.07 | **+0.21** |
| **Human-Elevated: Temporal Complexity & Discontinuity** |
| 25 | `REV` | Depth of Recontextualization After Surprise | `scale` | How extensively does a revelation force reinterpretation of earlier scenes? | 3.28 | 2.95 | **+0.33** |
| 26 | `TMP` | Degree of Chronological Discontinuity | `scale` | How often does the narrative jump across time? | 2.40 | 2.12 | **+0.28** |
| 27 | `REV` | Nonlinear Framing for Delayed Disclosure | `scale` | To what extent does the story use time jumps to stage revelations? | 1.96 | 1.68 | **+0.28** |
| 28 | `TMP` | Anachrony Intensity | `scale` | How heavily does the narrative rely on flashbacks or flashforwards? | 2.58 | 2.31 | **+0.27** |
| **Human-Elevated: Narrative Diversity & Ambivalence** |
| 29 | `SET` | Location Variety Scope | `ord` | How many distinct physical locales does the story inhabit? | 1.34 | 1.08 | **+0.26** |
| 30 | `PER` | Dialogue-to-Narration Proportion | `scale` | What proportion of text is direct dialogue vs. narration? | 2.95 | 2.70 | **+0.25** |
| 31*| `PLT` | Subplot Integration → `thematically parallel` | `cat` | How directly do subplots echo the central theme? (Contrasting/parallel) | 42% | 21% | **+21%** |
| 32*| `PLT` | Moral Polarity Toward Protagonist → `ambivalent` | `cat` | Does narrative frame protagonist's choices as morally clear or ambiguous? | 59% | 38% | **+21%** |
| 33*| `AGENT` | Emotional Expression → `explicit labels` | `cat` | How are emotions conveyed? (Direct naming: 'felt afraid', 'was furious') | 29% | 8% | **+21%** |

*(Note: Items 31–33 represent complementary human-leaning core features from Table 15 & 16 that form the basis of the 30 core feature set).*

---

## 2. Theoretical Grounding: The 10 NarraBench Dimensions

The StoryScope features are organized according to the **NarraBench taxonomy** (Hamilton et al., 2025; Genette, 1980; Tian et al., 2024):

1. **`AGENT` (Agents)**: Character agency, character introductions, social density, motivation trajectories, and emotional expression modes.
2. **`SOC` (Social Networks)**: Relational topologies, dyadic vs. group scene dominance, community salience, rumor and gossip dynamics.
3. **`EVT` (Events)**: Beat-level causal sequences, causal chain continuity, global schemas (journey, trial, heist, ordeal), and resolution mechanisms.
4. **`PLT` (Plot)**: Obstacles, conflicts, thematic unity, subplot integration, and moral trajectory of protagonist choices.
5. **`SET` (Setting)**: Spatial grounding, spatial granularity, location variety, sensory density, olfactory engagement, and pathetic fallacy (setting as psychological mirror).
6. **`TMP` (Time & Temporality)**: Narrative duration, chronological continuity, anachrony intensity (flashbacks/flashforwards), and retrospection.
7. **`REV` (Revelation & Discourse)**: Suspense staging, curiosity gaps, delayed disclosure, and recontextualization depth after surprise.
8. **`PER` (Perspective & Narration)**: Point of view, breadth of focalization, interior access depth, direct dialogue proportion, and dialogue function.
9. **`SIT` (Situatedness)**: Thematic explicitness, moralizing, narratorial commentary, intertextual strategies (explicit vs. implicit), and reader address.
10. **`STR` (Structure)**: Macroscopic story organization, chapter/scene transitions, and architectural symmetry.

---

## 3. The Rarity Metric: Quantifying Originality

The paper operationalizes narrative originality using **statistical rarity in narrative feature space**:
- Defined as the mean Euclidean distance to a story's $k = 25$ nearest neighbors in the pooled narrative space ($d = 304$).
- **Human stories have a significantly higher mean rarity percentile** ($0.71$ for Human vs. $0.49$ for AI; Cohen's $d = 0.83$).
- In the top 10% rarest stories corpus-wide, human stories are **3.5x overrepresented** (24.7% of human stories fall in the top 10%, compared to only 7.1% of AI stories).
- When five AI models and one human write to the exact same prompt, **the human story is the rarest version 57.8% of the time** (versus a 16.7% random chance).

**Takeaway for Humanizer 2.0**: To produce human-like writing, agents must consciously select **atypical, dispersed combinations of narrative decisions** rather than collapsing into the high-density centroid where all AI models cluster.
