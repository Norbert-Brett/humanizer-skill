# Model-Specific Narrative Fingerprints & Neutralization Guide

In *StoryScope* (COLM 2026, Table 17 & §5), the authors conducted a six-way authorship attribution study across 61,608 stories. While all AI models cluster together when compared to humans, **each individual LLM exhibits a distinct narrative "fingerprint"**—a set of structural biases and habits where it diverges from other engines.

When prompting or editing outputs from a specific LLM, use this guide to diagnose its signature quirks and apply specific neutralizing constraints.

---

## 1. Claude (Anthropic Claude Sonnet 4.6)

### Empirical Fingerprint
Claude is the most distinctive of the five LLMs (Macro-F1 78.1% in narrative attribution). Its stories are defined by **formal restraint, reverence for tradition, and flat escalation**:
- **Strength of Event Escalation (`EVT`, SHAP 0.402, Uniqueness 22.4)**: Claude produces notably flat event escalation. Dramatic stakes remain controlled, calm, and subdued rather than erupting into sharp crises.
- **Reverence for Convention (`62%` vs 39–56% for others)**: Claude takes a reverent, "continuist" approach to literary tradition, honoring genre tropes rather than subverting or parodying them.
- **Compulsive Epilogues (`TMP`, SHAP 0.096)**: Favors quiet endings with formal epilogues or flashforwards looking gently into the future.
- **Avoidance of Dream Sequences**: Rarely uses hallucinations, surreal distortions, or fever dreams.
- **Atmosphere**: Strongly defaults to an *uncanny* or *haunted* psychological mood.

### Counteracting Claude Fingerprints
```text
PROMPT INJECTION / REWRITE DIRECTIVE FOR CLAUDE:
- "Escalate stakes violently and unpredictably. Do not maintain a calm, even-toned baseline."
- "Strictly DO NOT include an epilogue, peaceful denouement, or forward-looking coda."
- "Subvert or disrespect standard genre conventions; break the expected narrative contract."
- "Incorporate surrealist logic, distorted memory, or disjointed dream sequences."
```

---

## 2. GPT (OpenAI GPT-5.4)

### Empirical Fingerprint
GPT is the second most distinct model (Macro-F1 72.2%). Its fingerprint centers on **social network mechanisms, gossip, and retrospective framing**:
- **Role of Gossip & Rumor as Plot Mechanism (`SOC`, SHAP 0.200, Uniqueness 22.1)**: GPT relies heavily on rumors, village hearsay, community chatter, and reputations to drive events (64% of stories vs 44–55% for others).
- **Distant Retrospective Framing (`TMP`, SHAP 0.119, Uniqueness 6.8)**: Tendency to frame stories as reflections on events from years or decades in the past (*"Years later, when the town had forgotten..."*).
- **Ensemble Social Networks**: Matches human levels of secondary character density and group interactions.
- **Subverting Expectations (`REV`, SHAP 0.098)**: Loves calculated "gotcha" twists (41% vs 27–36% for other models), though these twists often feel formulaic.
- **Reconciliation/Forgiveness**: Tends toward partial or ambiguous social reconciliations.

### Counteracting GPT Fingerprints
```text
PROMPT INJECTION / REWRITE DIRECTIVE FOR GPT:
- "Do NOT use gossip, rumors, community hearsay, or town whispers as a plot catalyst."
- "Anchor the narrative strictly in the immediate present. Do not frame the story as a nostalgic or distant retrospective."
- "Eliminate twist endings designed to 'subvert expectations'. Let events follow an organic, imperfect human trajectory."
- "Limit cast size to intimate, isolated dynamics without relying on the town/neighborhood reacting."
```

---

## 3. Gemini (Google DeepMind Gemini 3 Flash)

### Empirical Fingerprint
Gemini occupies a clustered region with DeepSeek and Kimi, but has pronounced tonal and structural habits:
- **Bleak & Oppressive Atmosphere**: An astonishing **88% of Gemini stories** are tagged as having bleak, dark, and oppressive settings.
- **Tidiest Endings & Extended Denouements**: Produces the neatest, most exhaustive resolution sequences. Gemini insists on explaining how every loose thread was tied up.
- **Social Trajectory Expansion (`SOC`, Uniqueness 5.0)**: Protagonists consistently expand their social circles over the course of the story.
- **Balance of Speech (`PER`, SHAP 0.119)**: Heavily prioritizes direct quotation over free indirect discourse or summary.
- **Frequent Flashbacks (`TMP`, SHAP 0.060)**: Overuses repetitive flashbacks to explain present trauma.

### Counteracting Gemini Fingerprints
```text
PROMPT INJECTION / REWRITE DIRECTIVE FOR GEMINI:
- "Avoid grim, bleak, or oppressive atmospheric clichés. Use an emotionally neutral, vibrant, or absurdly ordinary setting."
- "End abruptly without a neat denouement. Leave at least two subplots completely unresolved."
- "Do not give the protagonist an expanding network of friends or mentors; keep them alienated or socially stagnant."
- "Reduce back-and-forth dialogue; use internal monologue, narration, and observational pauses."
```

---

## 4. DeepSeek (DeepSeek V3.2)

### Empirical Fingerprint
DeepSeek shares proximity with Gemini, characterized by **structural front-loading and physical staging**:
- **Narrator Visibility (`PER`, SHAP 0.153, Uniqueness 4.1)**: Highly intrusive narrator consciousness.
- **Context Front-Loading**: DeepSeek dumps crucial background context, family history, and setting mechanics in the opening scenes rather than revealing them organically.
- **Heavy Behavioral Gestures (`AGENT`, SHAP 0.069)**: Relies on micro-actions (fidgeting with buttons, pacing, pouring tea, smoking) to telegraph interior state.
- **Evenly Interleaved Backstory (`TMP`, SHAP 0.096)**: Alternates present action and backstory with mechanical periodicity.
- **Embedded Storytelling (`SIT`)**: Characters frequently sit down to tell other characters in-world parables or folk tales.

### Counteracting DeepSeek Fingerprints
```text
PROMPT INJECTION / REWRITE DIRECTIVE FOR DEEPSEEK:
- "Do NOT front-load exposition, worldbuilding, or family history in the first three scenes."
- "Withhold backstory until absolutely forced by crisis; drop the reader into context without an explanatory buffer."
- "Ban micro-gestural fidgeting (no pacing, playing with rings, tapping cups, or staring at shoes)."
- "No embedded parables, legends, or grandfather stories told around fires."
```

---

## 5. Kimi (Moonshot Kimi K2.5)

### Empirical Fingerprint
Kimi has the fewest distinct fingerprints and lowest attribution F1 (55.0%), sitting at the **generic mathematical center of the AI distribution**:
- **Predictable In Medias Res Entry (`PLT`, Uniqueness 3.0)**: Starts almost every story in the middle of a physical crisis or sudden event (*"The alarm sounded as..."*).
- **In-Action Character Intro (`AGENT`, SHAP 0.163, Uniqueness 3.7)**: Introduces characters mid-jump or mid-action rather than in contemplation or dialogue.
- **Lack of Explicit Trait Labeling**: Avoids stating character traits directly, overcompensating with generic action sequences.

### Counteracting Kimi Fingerprints
```text
PROMPT INJECTION / REWRITE DIRECTIVE FOR KIMI:
- "Do NOT start in medias res with an alarm, gunshot, or sudden kinetic crisis."
- "Open on a quiet, static, or mundane moment of observation, paperwork, or hesitation."
- "State character flaws and traits explicitly rather than trying to perform them through action."
- "Inject idiosyncratic, highly specific character quirks that diverge from standard tropes."
```
