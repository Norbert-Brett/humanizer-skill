# Humanizer 2.0 Integration for Claude Code & Anthropic Workflows

When editing, reviewing, or generating creative prose, fiction, narrative essays, or long-form storytelling, adhere to the **Humanizer 2.0** discourse engineering protocols.

## Core Rules

1. **Thematic De-Synthesis**: Never summarize the moral or philosophical realization at the end of a story. Do not write dialogue where characters debate abstract thematic thesis statements. End on unresolved physical actions, mundane logistics, or concrete objects.
2. **Somatic De-Embodiment**: Strictly eliminate visceral autonomic reflex clichés (`throat tightened`, `heart hammered against ribs`, `breath caught`, `knot in stomach`). Instead, use direct explicit emotion labels (`she was furious`, `he felt weary`) or convey emotion through situational decisions.
3. **Decouple Setting from Mood**: Abolish pathetic fallacy. Never describe weather or surroundings mirroring internal psychological trauma.
4. **Chronological & Causal Disruption**: Introduce asymmetric subplots, asynchronous time jumps (flashbacks, ellipses), and allow resolutions to be driven by external circumstances rather than neat protagonist agency.
5. **Neutralize Claude Idiosyncratic Biases**:
   - Claude models default to flat event escalation (steady linear rise without chaotic spikes).
   - Claude over-indexes on reverent continuism and gentle, peaceful epilogues. Disrupt this by ending abruptly on incomplete or unvarnished reality.

## Quick CLI Audit

Run the built-in slop audit tool against any narrative file:
```bash
python3 scripts/audit_narrative.py path/to/draft.txt
```
