#!/usr/bin/env cbqn

# -- Day 1 --
## - Part 1 -

# Given d, a distance, and t, the total time,
# find h, the hold time that results
# in a distance greater than d.
# h*(t-h) > d
# 0 > h^2 -th + d

d ← ⟨
  "Time:      7  15   30"
  "Distance:  9  40  200"
⟩
d ↩ •Flines "../data/d6.txt"

Ints ← {•ParseFloat¨ {1-˜ m× +` »⊸< m←('0'+↕10)∊˜𝕩}⊸⊔𝕩}
Solve ← {t𝕊d:
  a1 ← ⌈ 2÷˜ ((√((d×4)-˜ 2⋆˜t)) + t)
  a2 ← ⌊ 2÷˜ ((√((d×4)-˜ 2⋆˜t)) -˜ t)
  1 -˜ a2 -˜ a1
}
•Show ×´ Solve○Ints´ d

## - Part 2 -

Nums ← {('0'+↕10)∊˜𝕩}⊸/
•Show Solve○{•ParseFloat Nums}´ d

