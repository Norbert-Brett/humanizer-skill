# The 3 AI Slop Syndromes: Pathologies & Antidotes

In *StoryScope* (COLM 2026), the authors discovered that when large language models write stories, they do not disperse across creative narrative space. Instead, across all five frontier models tested (Claude Sonnet 4.6, GPT-5.4, Gemini 3 Flash, DeepSeek V3.2, Kimi K2.5), they **cluster into a tight, shared region of narrative space**.

This clustering is caused by three pathological narrative syndromes that define machine-generated storytelling.

---

## Syndrome 1: Thematic Over-Determination & Moralizing

### The Pathology
LLMs are trained via RLHF and alignment objectives to be helpful, transparent, and morally constructive. When generating fiction, this training leaks into narrative structure as a neurotic terror of leaving themes implicit or morally unresolved:
- **Thematic Explicitness**: AI scores `3.94` on a 1–5 scale vs. `3.28` for humans (Gap: `−0.65`).
- **Narratorial Sermonizing**: In **77% of AI stories**, the narrator steps out of the character's perspective to explicitly comment on the story's moral or philosophical theme (compared to `52%` in human stories).
- **Philosophical Soapboxing**: In **59% of AI stories**, dialogue is turned into a philosophical debate where characters discuss abstract principles rather than immediate, selfish, or mundane stakes (`34%` for humans).
- **The "Lesson Learned" Epilogue**: A grieving character's arc will invariably end with the narrator stating the lesson learned about love, loss, memory, or human endurance.

### The Mechanism in Text
```text
[AI SLOP TYPICAL RESOLUTION]
As Clara stared at the broken clock, she realized that grief was not a cage to escape, 
but a landscape to inhabit. Time had not stolen her father's love; it had merely preserved 
it in amber. And in that quiet realization, she finally understood what forgiveness meant.
```

### The Humanizer 2.0 Antidotes
1. **Kill the Epilogue / Summary**: Delete the final two paragraphs if they exist to synthesize a takeaway. End on a concrete sensory object, an unresolved question, a physical departure, or an interruption.
2. **Subvert Dialogue Purpose**: Force dialogue to serve logistical friction, defensive humor, avoidance, or power dynamics. If two characters begin discussing "the nature of duty" or "what it means to be alive", interrupt them with a practical problem (e.g., a car engine stalling, a bill arriving, an uncomfortable silence).
3. **Embrace Unstated Premise**: Trust the reader completely. If your story is about sacrifice, never use the word "sacrifice", "cost", or "price" in the narrative commentary.

---

## Syndrome 2: Sensory & Embodied Performativity (Over-Writing the Flesh)

### The Pathology
Due to internet creative writing guidelines hammering "Show, Don't Tell", LLMs have over-optimized for physical symptoms of emotion. The single largest statistical gap in the entire 60,000-story study is **Embodied Emotional Expression**:
- **Embodied Metaphors**: Found in **81% of AI stories** versus only **38% of human stories** (a massive `43%` gap!).
- **Explicit Emotion Labels**: Human authors use direct naming (*"she felt terrified"*, *"he was tired"*, *"she despised him"*) in **29% of stories**, compared to a pathetic **8% in AI**.
- **The Olfactory Reflex**: AI features smell imagery in **82% of stories** vs. `57%` in humans (`−25%` gap). AI compulsively reaches for smells (*copper, ozone, petrichor, rot, woodsmoke, damp earth*) to perform literary depth.
- **Pathetic Fallacy (Setting as Mirror)**: Physical environments mirror emotional states in AI writing at `4.07` vs `3.58` for humans (`−0.49` gap). Whenever a protagonist is sad, it rains; when panicked, the shadows stretch oppressively.

### The Mechanism in Text
```text
[AI SLOP SOMATIC CLICHÉ]
A cold sweat prickled at the nape of his neck. His throat constricted, his heart hammering 
violently against the cage of his ribs as bile rose in his mouth. The air smelled sharply 
of ozone and damp cellar earth, mirroring the suffocating terror that took root inside him.
```

### The Humanizer 2.0 Antidotes
1. **The Bodily Cliché Ban**: Ban autonomic bodily involuntary reactions from your drafting:
   - *No throat tightening or constricting.*
   - *No heart hammering, thudding against ribcages, or skipping beats.*
   - *No cold sweat on napes or palms.*
   - *No breath catching in chests or throats.*
   - *No stomachs dropping or knots forming in guts.*
2. **Use Direct Emotion Labels**: State the emotion directly and plainly when appropriate:
   - *Human*: *"Marcus was terrified. He wanted to go home and lie on the couch."*
   - *AI*: *"Terror seized Marcus, turning his blood to ice as his trembling fingers clawed at the doorknob."*
3. **Decouple the Weather & Environment**: Make the physical world indifferent or ironic:
   - If a funeral is occurring, make the weather bright, sunny, and hot, with a lawnmower buzzing in the next lot.
   - If a celebration occurs, make the venue drafty and smelling of burnt coffee.
4. **Throttle Olfactory References**: Cut 70% of smell descriptions. Humans perceive through vision, action, spatial geometry, and social friction far more than constant olfactory cues.

---

## Syndrome 3: Structural Streamlining & Causal Hyper-Linearity

### The Pathology
AI models are sequential prediction machines; by default, they construct narratives as **tight, single-track conveyor belts**:
- **Causal Chain Continuity**: AI scores `4.20` vs `3.92` for humans. Every event is a direct domino consequence of the prior event. There are no side-quests, false leads, or random intrusions of life.
- **Subplot Erasure**: **79% of AI stories contain zero subplots** (compared to `57%` in human stories). AI focuses on a single thread from start to finish.
- **Protagonist Agency Monopoly**: In **69% of AI stories**, the resolution is caused purely by the protagonist's active, conscious choice (vs `46%` in humans).
- **Neat Emotional Closure**: **47% of AI resolutions** end in internal understanding, acceptance, or self-forgiveness (vs `27%` in humans).
- **Chronological Monotony**: AI rarely uses non-linear jumps, flashbacks, or asynchronous disclosures. A mystery starts at clue #1 and walks forward to the confession.

### The Mechanism in Text
```text
[AI SLOP LINEAR ARC]
Incident occurs -> Protagonist investigates directly -> Confronts antagonist ->
Makes deliberate moral choice -> Achieves internal emotional acceptance and growth.
(No interruptions, no parallel concerns, no unresolved loose ends).
```

### The Humanizer 2.0 Antidotes
1. **Inject Asymmetrical B-Plots (Subplots)**:
   - Give the protagonist an annoying, parallel practical obligation that interrupts the main plot (e.g., trying to solve a burglary while dealing with a leaking washing machine and an ailing parent).
   - In human writing, subplots do not always echo the main theme; they often contrast or provide comic/tragic relief (42% in humans vs 21% in AI).
2. **Break Chronological Order (Anachrony)**:
   - Open *in media res* or after the fallout, then jump backward via memory or testimony.
   - Use time jumps (ellipses): skip over three weeks of mundane waiting rather than narrating every continuous day.
3. **Introduce External Fate & Loose Ends**:
   - Resolve conflicts through external intervention, accident, misunderstanding, or third-party interference.
   - Leave 1–2 secondary questions completely unanswered at the conclusion. Real life and human fiction are full of unresolved threads.
4. **Protagonist Ambiguity**:
   - Let the protagonist make a cowardly, selfish, or morally ambiguous choice (59% in human writing vs 38% in AI). Do not have them self-flagellate or give a speech apologizing for it.
