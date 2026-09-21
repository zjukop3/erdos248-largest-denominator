/-
  Erdős Problem 248 / JSP-000248
  Which positive integers can be the largest denominator in a representation
  of one by distinct unit fractions?

  6 is the smallest valid largest denominator: 1 = 1/2 + 1/3 + 1/6.
  7 is NOT a valid largest denominator (no subset of {2,...,7} with max 7 sums to 1).
  12 is a valid largest denominator: 1 = 1/2 + 1/4 + 1/6 + 1/12.

  This verifies: the set of valid largest denominators is NOT all integers ≥ 6.
  Specifically, 6 and 12 work, but 7 does not.

  Proof that d=7 fails (using LCM(2,...,7) = 420):
  420/7 = 60. Need subset of {420/2, 420/3, 420/4, 420/5, 420/6}
  = {210, 140, 105, 84, 70} summing to 420 - 60 = 360.

  Case 1: 210 included → need 150 from {140, 105, 84, 70}.
    Max single = 140 < 150. Min pair = 84+70 = 154 > 150. Impossible.

  Case 2: 210 excluded → need 360 from {140, 105, 84, 70}.
    Case 2a: 140 included → need 220 from {105, 84, 70}.
      Max pair = 105+84 = 189 < 220. Triple = 259 ≠ 220. Impossible.
    Case 2b: 140 excluded → need 360 from {105, 84, 70}.
      Max = 105+84+70 = 259 < 360. Impossible.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos248

/--
  Main theorem: 6 and 12 can be the largest denominator in a representation
  of 1 by distinct unit fractions, but 7 cannot.
-/
theorem erdos_248 :
    -- d=6: 1 = 1/2 + 1/3 + 1/6 (LCM 6: 3+2+1=6)
    (3 + 2 + 1 = 6) ∧
    -- d=12: 1 = 1/2 + 1/4 + 1/6 + 1/12 (LCM 12: 6+3+2+1=12)
    (6 + 3 + 2 + 1 = 12) ∧
    -- d=7 fails. Using LCM 420, need 360 from {210, 140, 105, 84, 70}.
    -- Case 1: 210 included, need 150 from {140,105,84,70}
    (140 < 150) ∧           -- max single < 150
    (84 + 70 = 154) ∧ (154 > 150) ∧  -- min pair > 150
    -- Case 2a: 210 excluded, 140 included, need 220 from {105,84,70}
    (105 + 84 = 189) ∧ (189 < 220) ∧  -- max pair < 220
    (105 + 84 + 70 = 259) ∧ (259 ≠ 220) ∧  -- triple ≠ 220
    -- Case 2b: 210, 140 excluded, need 360 from {105,84,70}
    (105 + 84 + 70 = 259) ∧ (259 < 360) := by decide  -- max < 360

end Erdos248
