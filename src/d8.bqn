#!/usr/bin/env cbqn

# -- Day 8 --
## - Part 1 -

# Starting at AAA, follow the left/right instructions.
# How many steps are required to reach ZZZ?

# We could also model this problem with two graphs,
# similar to day 4, one of L mappings, and one of R mappings.

d ← ⟨
  "RL"
  ""
  "AAA = (BBB, CCC)"
  "BBB = (DDD, EEE)"
  "CCC = (ZZZ, GGG)"
  "DDD = (DDD, DDD)"
  "EEE = (EEE, EEE)"
  "GGG = (GGG, GGG)"
  "ZZZ = (ZZZ, ZZZ)"
⟩
# d ↩ ⟨
#   "LLR"
#   ""
#   "AAA = (BBB, BBB)"
#   "BBB = (AAA, ZZZ)"
#   "ZZZ = (ZZZ, ZZZ)"
# ⟩
# d ↩ ⟨
#   "LR"
#   ""
#   "11A = (11B, XXX)"
#   "11B = (XXX, 11Z)"
#   "11Z = (11B, XXX)"
#   "22A = (22B, XXX)"
#   "22B = (22C, 22C)"
#   "22C = (22Z, 22Z)"
#   "22Z = (22B, 22B)"
#   "XXX = (XXX, XXX)"
# ⟩
d ↩ •Flines "../data/d8.txt"

Split ← (⊢-˜+`×¬)∘=⊔⊢

in ← ⊑d
n‿l‿r ← <˘⍉> {(3↑𝕩)‿(3↑7↓𝕩)‿(3↑12↓𝕩)}¨ 2↓d
sn ← ⊑n⊐<"AAA"
gn ← ⊑n⊐<"ZZZ"

ci ← 0
{𝕊cn:
  ins ← (ci|˜≠in)⊑in
  key ← cn⊑('L'=ins)⊑r‿l
  ci +↩1
  ⊑n⊐<key
}•_while_ (gn⊸≢) sn
•Show ci

## - Part 2 -

