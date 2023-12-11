#!/usr/bin/env cbqn

# -- Day 7 --
## - Part 1 -

d ← ⟨
  "32T3K 765"
  "T55J5 684"
  "KK677 28"
  "KTJJT 220"
  "QQQJA 483"
⟩
d ↩ •Flines "../data/d7.txt"

Split ← (⊢-˜+`×¬)∘=⊔⊢

h‿b ← <˘⍉> ' 'Split¨ d
b •ParseFloat¨↩
Type ← {2↑ ∨/⁼⊐𝕩}
Strength ← "23456789TJQKA"⊸⊐
•Show +´ b× 1+ ⍋⍋>(Type∾Strength)¨ h

## - Part 2 -

Type2 ← {𝕊𝕩:
  jm ← 'J'=𝕩
  nj ← +´jm
  hand ← (¬jm)/𝕩
  nj‿0 + 2↑ ∨/⁼⊐hand
}

Strength2 ← "J23456789TQKA"⊸⊐
•Show +´ b× 1+ ⍋⍋>(Type2∾Strength2)¨ h
