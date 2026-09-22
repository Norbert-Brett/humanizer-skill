#!/usr/bin/env python3
"""
audit_narrative.py - StoryScope Narrative Slop Auditor (Humanizer 2.0)

A diagnostic CLI tool grounded in the empirical findings of the research paper:
"StoryScope: Investigating idiosyncrasies in AI fiction" (Russell et al., COLM 2026).

Evaluates narrative text against the 30 core features that distinguish human from
synthetic AI prose, focusing on discourse-level choices:
- Somatic / Embodied Emotion Clichés vs. Explicit Emotion Labeling
- Thematic Over-determination & Moralizing Epilogues
- Olfactory / Smell Imagery Overuse
- Pathetic Fallacy (Setting mirroring emotion)
- Temporal Complexity & Historical/Named Cultural Anchors
"""

import sys
import re
import argparse
from typing import Dict, List, Tuple

# Regex patterns for somatic / embodied emotional clichés (AI: 81% vs Human: 38%)
SOMATIC_CLICHE_PATTERNS = [
    r"\bthroat\s+(?:tightened|constricted|closed\s+up|dry)\b",
    r"\bheart\s+(?:hammered|thudded|pounded|raced|skipped\s+a\s+beat)\b",
    r"\b(?:cold|clammy)\s+sweat\b",
    r"\bbreath\s+(?:caught|hitched|trapped|stolen)\b",
    r"\b(?:stomach|gut)\s+(?:dropped|churned|twisted|knotted)\b",
    r"\bknot\s+(?:of\s+dread|formed\s+in|tightened\s+in)\b",
    r"\bbile\s+(?:rose|burned|tasted)\b",
    r"\bchill\s+(?:ran|crept|shot|rippled)\s+down\s+(?:his|her|their|my)\s+spine\b",
    r"\bblood\s+(?:ran\s+cold|froze|boiled)\b",
    r"\b(?:clenched|white-knuckled)\s+(?:fists|jaw)\b",
    r"\btrembling\s+(?:hands|fingers|knees)\b",
]

# Explicit emotion labels (Human: 29% vs AI: 8%)
EXPLICIT_EMOTION_PATTERNS = [
    r"\b(?:was|felt|became)\s+(?:afraid|terrified|scared|frightened)\b",
    r"\b(?:was|felt|became)\s+(?:angry|furious|irritated|annoyed|livid)\b",
    r"\b(?:was|felt|became)\s+(?:sad|depressed|miserable|heartbroken)\b",
    r"\b(?:was|felt|became)\s+(?:relieved|grateful|calm|content)\b",
    r"\b(?:was|felt|became)\s+(?:exhausted|weary|tired|drained)\b",
    r"\b(?:was|felt|became)\s+(?:confused|bewildered|puzzled)\b",
    r"\b(?:was|felt|became)\s+(?:jealous|envious|resentful)\b",
]

# Olfactory / Smell markers (AI: 82% vs Human: 57%)
OLFACTORY_PATTERNS = [
    r"\b(?:smell|smelled|smelling|scent|aroma|stench|odor|perfume)\s+(?:of)?\b",
    r"\bpetrichor\b",
    r"\bozone\b",
    r"\bmetallic\s+tang\b",
    r"\bcopper\s+and\b",
    r"\bwafted\b",
]

# Pathetic fallacy / setting mirroring emotion (AI: 4.07 vs Human: 3.58)
PATHETIC_FALLACY_PATTERNS = [
    r"\b(?:rain|sky|wind|shadows?|storm)\s+(?:mirrored|reflected|echoed|wept)\b",
    r"\bmirroring\s+(?:his|her|their|the)\s+(?:quiet|inner|deep|dark|somber)?\s*(?:melancholy|grief|sorrow|turmoil|fear)\b",
    r"\bas\s+if\s+the\s+(?:heavens|sky|room|house)\s+(?:itself\s+)?(?:mourned|felt|knew)\b",
]

# Thematic over-determination & moralizing wrap-up indicators (AI: 77% vs Human: 52%)
MORALIZING_PATTERNS = [
    r"\brealized\s+(?:that\s+)?(?:true|the\s+real|what\s+it\s+meant)\b",
    r"\b(?:in\s+that\s+moment|finally),\s*(?:he|she|they|I)\s+(?:understood|knew|realized)\b",
    r"\bwas\s+not\s+(?:just\s+)?about\s+.*,\s*but\s+(?:about)?\b",
    r"\bthe\s+true\s+meaning\s+of\b",
    r"\ba\s+quiet\s+(?:sense\s+of\s+)?acceptance\b",
    r"\bpeace\s+(?:settled|washed)\s+over\b",
    r"\bpreserv(?:ed|ing)\s+it\s+in\s+amber\b",
    r"\blandscape\s+to\s+inhabit\b",
]

# Temporal anachrony / non-linear cues (Human-elevated: +0.28 gap)
ANACHRONY_PATTERNS = [
    r"\b(?:years|months|weeks|days|decades)\s+(?:earlier|before|prior|ago)\b",
    r"\bhad\s+(?:long\s+since|already|once\s+been)\b",
    r"\bin\s+(?:nineteen|twenty|\d{4})\b",
    r"\brecalled\s+the\s+(?:time|day|summer|winter)\b",
    r"\bflash(?:ed)?\s+back\b",
]

# Direct reader address / 4th wall permeability (Human: 4x higher)
READER_ADDRESS_PATTERNS = [
    r"\b(?:dear\s+reader|reader,|you\s+might\s+wonder|you\s+see,)\b",
    r"\b(?:if\s+you\s+have\s+ever|mind\s+you,)\b",
]


def analyze_text(text: str) -> Dict:
    words = re.findall(r"\b\w+\b", text)
    word_count = max(len(words), 1)
    
    # Split paragraphs
    paragraphs = [p.strip() for p in text.split("\n\n") if p.strip()]
    ending_text = "\n".join(paragraphs[-2:]) if len(paragraphs) >= 2 else text

    def find_matches(patterns: List[str], target_str: str) -> List[Tuple[str, str]]:
        matches = []
        for pat in patterns:
            for m in re.finditer(pat, target_str, flags=re.IGNORECASE):
                # extract brief context
                start = max(0, m.start() - 20)
                end = min(len(target_str), m.end() + 20)
                snippet = target_str[start:end].replace("\n", " ")
                matches.append((m.group(0), snippet))
        return matches

    somatic_matches = find_matches(SOMATIC_CLICHE_PATTERNS, text)
    explicit_matches = find_matches(EXPLICIT_EMOTION_PATTERNS, text)
    olfactory_matches = find_matches(OLFACTORY_PATTERNS, text)
    pathetic_matches = find_matches(PATHETIC_FALLACY_PATTERNS, text)
    moralizing_matches = find_matches(MORALIZING_PATTERNS, ending_text)
    anachrony_matches = find_matches(ANACHRONY_PATTERNS, text)
    reader_matches = find_matches(READER_ADDRESS_PATTERNS, text)

    # Rates per 1,000 words
    somatic_rate = (len(somatic_matches) / word_count) * 1000
    explicit_rate = (len(explicit_matches) / word_count) * 1000
    olfactory_rate = (len(olfactory_matches) / word_count) * 1000

    # Slop penalties / human credits calculation
    slop_score = 0.0
    
    # 1. Somatic overload vs explicit emotion penalty
    if somatic_rate > 1.5:
        slop_score += min(35.0, somatic_rate * 12.0)
    elif somatic_rate > 0.5:
        slop_score += 15.0
        
    if explicit_rate > 0.8:
        slop_score -= 10.0  # human-like directness bonus
        
    # 2. Olfactory overuse penalty
    if olfactory_rate > 1.2:
        slop_score += min(20.0, olfactory_rate * 8.0)
        
    # 3. Pathetic fallacy penalty
    if len(pathetic_matches) > 0:
        slop_score += 15.0 * len(pathetic_matches)
        
    # 4. Moralizing epilogue penalty (Heavily weighted in StoryScope)
    if len(moralizing_matches) > 0:
        slop_score += 25.0 * len(moralizing_matches)
        
    # 5. Temporal anachrony credit
    if len(anachrony_matches) >= 2:
        slop_score -= 15.0
    elif len(anachrony_matches) == 1:
        slop_score -= 5.0

    # 6. Reader engagement credit
    if len(reader_matches) > 0:
        slop_score -= 10.0

    # Normalize to 0 - 100%
    normalized_score = max(0.0, min(100.0, slop_score))

    return {
        "word_count": word_count,
        "paragraph_count": len(paragraphs),
        "slop_score": round(normalized_score, 1),
        "somatic_matches": somatic_matches,
        "explicit_matches": explicit_matches,
        "olfactory_matches": olfactory_matches,
        "pathetic_matches": pathetic_matches,
        "moralizing_matches": moralizing_matches,
        "anachrony_matches": anachrony_matches,
        "reader_matches": reader_matches,
    }


def print_report(res: Dict):
    score = res["slop_score"]
    
    print("=" * 70)
    print(" STORYSCOPE NARRATIVE SLOP AUDIT REPORT (HUMANIZER 2.0)")
    print("=" * 70)
    print(f" Analyzed Words:      {res['word_count']}")
    print(f" Paragraphs:          {res['paragraph_count']}")
    print("-" * 70)
    
    if score >= 65.0:
        verdict = "CRITICAL RISK: HIGH SYNTHETIC AI SLOP PROFILE"
        recommendation = "Reject / Full structural rewrite required (see Humanizer 2.0 Playbook)."
    elif score >= 35.0:
        verdict = "MODERATE RISK: MIXED PROFILE WITH DETECTABLE AI BIASES"
        recommendation = "Selective refactoring of somatic clichés and thematic wrap-ups."
    else:
        verdict = "LOW RISK: DIVERSE HUMAN-LIKE NARRATIVE DISCOURSE"
        recommendation = "Passes narrative discourse criteria. Well-dispersed narrative space."

    print(f" AI Slop Score:       {score}%")
    print(f" Assessment:          {verdict}")
    print(f" Recommendation:      {recommendation}")
    print("=" * 70)
    print("\nDETAILED FEATURE BREAKDOWN:\n")

    # Moralizing
    print(f"[1] Thematic Over-determination & Moralizing: {len(res['moralizing_matches'])} flagged")
    if res['moralizing_matches']:
        for m, snip in res['moralizing_matches']:
            print(f"    - Flag: '{m}' in '...{snip}...'")
        print("    -> Action: Delete the moralizing conclusion. End on a concrete object or mundane action.")
    else:
        print("    -> Clean: No overt sermonizing or lesson-summary formulas detected.")

    # Somatic
    print(f"\n[2] Somatic / Bodily Cliché Reflexes: {len(res['somatic_matches'])} flagged")
    if res['somatic_matches']:
        for m, snip in res['somatic_matches'][:5]:
            print(f"    - Flag: '{m}' in '...{snip}...'")
        if len(res['somatic_matches']) > 5:
            print(f"    - ... and {len(res['somatic_matches']) - 5} more.")
        print("    -> Action: De-embody emotions. Replace throat-tightening/chest-pounding with direct labels or situational reactions.")
    else:
        print("    -> Clean: Low/zero visceral autonomic clichés.")

    # Explicit emotion
    print(f"\n[3] Explicit Emotion Labels: {len(res['explicit_matches'])} found")
    if res['explicit_matches']:
        print(f"    -> Positive: Found direct emotion naming (human-elevated trait +21%).")
    else:
        print("    -> Advisory: Zero explicit emotion labels found. Consider naming feelings plainly rather than over-indexing on physical spasms.")

    # Olfactory
    print(f"\n[4] Olfactory / Smell Imagery: {len(res['olfactory_matches'])} flagged")
    if res['olfactory_matches']:
        for m, snip in res['olfactory_matches'][:3]:
            print(f"    - Flag: '{m}' in '...{snip}...'")
        print("    -> Action: Check if smell is strictly necessary; prune artificial scent markers.")
    else:
        print("    -> Clean: Smell modalities within natural limits.")

    # Pathetic fallacy
    print(f"\n[5] Setting as Psychological Mirror (Pathetic Fallacy): {len(res['pathetic_matches'])} flagged")
    if res['pathetic_matches']:
        for m, snip in res['pathetic_matches']:
            print(f"    - Flag: '{m}' in '...{snip}...'")
        print("    -> Action: Decouple setting from character mood. Introduce environmental indifference or irony.")
    else:
        print("    -> Clean: Setting does not overtly mirror emotional headspace.")

    # Temporal anachrony
    print(f"\n[6] Temporal Anachrony & Historical Anchoring: {len(res['anachrony_matches'])} detected")
    if res['anachrony_matches']:
        print(f"    -> Positive: Chronological discontinuity detected (flashbacks, jumps, named dates).")
    else:
        print("    -> Warning: Single-track linear timeline suspected. Consider flashbacks, ellipses, or asynchronous disclosure.")

    # Reader address
    print(f"\n[7] Reader Engagement & Fourth Wall: {len(res['reader_matches'])} detected")
    if res['reader_matches']:
        print(f"    -> Positive: Direct audience awareness present.")

    print("\n" + "=" * 70)


def main():
    parser = argparse.ArgumentParser(
        description="Audit text against StoryScope narrative AI slop features (Humanizer 2.0)."
    )
    parser.add_argument("file", nargs="?", help="Path to text file to audit (reads stdin if omitted).")
    args = parser.parse_args()

    if args.file:
        try:
            with open(args.file, "r", encoding="utf-8") as f:
                content = f.read()
        except Exception as e:
            print(f"Error reading file {args.file}: {e}", file=sys.stderr)
            sys.exit(1)
    else:
        if sys.stdin.isatty():
            parser.print_help()
            sys.exit(0)
        content = sys.stdin.read()

    results = analyze_text(content)
    print_report(results)
    
    # Exit with code 1 if slop score is critical
    sys.exit(1 if results["slop_score"] >= 65.0 else 0)


if __name__ == "__main__":
    main()
