import unittest
import sys
import os

# Add scripts directory to path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "scripts")))
from audit_narrative import analyze_text


class TestNarrativeAudit(unittest.TestCase):
    def test_clean_humanized_text(self):
        text = """
        Elena sat on the radiator under the third-floor catwalk, checking the seals on the fuel manifold with an adjustable wrench. Three years ago, back at the drydock in Rotterdam, the inspector had warned her that these titanium bolts would strip after four pressurizations. He had been right about the third one.

        She was exhausted, and more than a little angry that the transfer pumps had taken four hours instead of forty minutes.

        "I know," Elena said. She picked up the torque wrench and went back to the flange.
        """
        results = analyze_text(text)
        self.assertLess(results["slop_score"], 35.0)
        self.assertEqual(len(results["somatic_matches"]), 0)
        self.assertGreater(len(results["explicit_matches"]), 0)

    def test_somatic_cliche_detection(self):
        text = "His throat tightened and his heart hammered against his ribs as a cold sweat broke out. His breath caught in his chest and a knot of dread formed in his stomach."
        results = analyze_text(text)
        self.assertGreaterEqual(len(results["somatic_matches"]), 4)
        self.assertGreaterEqual(results["slop_score"], 35.0)

    def test_moralizing_wrapup_detection(self):
        text = """
        They walked toward the gate together.

        In that moment, she understood what it truly meant to let go, finding a quiet sense of acceptance that preserved their memories in amber.
        """
        results = analyze_text(text)
        self.assertGreaterEqual(len(results["moralizing_matches"]), 1)

    def test_pathetic_fallacy_detection(self):
        text = "The dark rain mirrored his deep sorrow as the sky itself mourned the fallen city."
        results = analyze_text(text)
        self.assertGreaterEqual(len(results["pathetic_matches"]), 1)


if __name__ == "__main__":
    unittest.main()
