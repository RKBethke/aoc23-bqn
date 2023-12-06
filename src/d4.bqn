#!/usr/bin/env cbqn

# -- Day 4 --
## - Part 1 -

# Figure out which of the numbers you have appear in the list of winning
# numbers. The first match makes the card worth one point and each match after
# the first doubles the point value of that card.

# How many points are they worth in total?

d ← ⟨
  "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
  "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19"
  "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1"
  "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83"
  "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36"
  "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
⟩
d ↩ •Flines"../data/d4.txt"

NN ← (>⟜«0⊸≤) / 0(0⊸≤××⟜10⊸+)`⊢
ToNats ← { NN 10⊸≤⊸(¬⊸×-⊣) 𝕩-'0' }
SplitOnChars ← ((⊢-˜¬×·+`»⊸<)∘∊˜⊔⊢)

matches ← {+´ ∊´ ToNats¨ 1↓ ":|" SplitOnChars 𝕩}¨ d
+´ 2⋆ 0⊸≤⊸/ 1-˜matches

## - Part 2 -

# You win copies of the scratchcards below the winning card equal to the number
# of matches.
# Process all of the original and copied scratchcards until no more
# scratchcards are won.
# Including the original set of scratchcards, how many total scratchcards do
# you end up with?
