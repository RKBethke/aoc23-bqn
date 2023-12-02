#!/usr/bin/env cbqn

# -- Day 2 --
## - Part 1 -

# Determine which games would have been possible if the bag had been loaded with
# only 12 red cubes, 13 green cubes, and 14 blue cubes.
# What is the sum of the IDs of those games?

# r‿g‿b

Split ← (⊢-˜+`×¬)∘=⊔⊢

d ← ⟨
  "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
  "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
  "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
  "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
  "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
⟩
d ↩ •Flines"../data/d2.txt"
d ' '⊸≠⊸/¨↩

PossibleGame ← {𝕊g:
	g {1⊑ ':' Split 𝕩}↩
  rounds ← ';' Split g
  hands ← ',' Split¨ rounds
  counts ← ('a'⊸<⊸⊔⊢)¨¨hands

  colors ← "red"‿"green"‿"blue"
  ColorMask ← {𝕊𝕩:
    color ← 3⥊1↓𝕩
    colors ≡¨ color
  }
  Count ← •Bqn ⊑

  hands ↩ +´¨(Count × ColorMask)¨¨counts
  ∧´⍟2 12‿13‿14⊸≥¨hands
}

idxs ← 0⊸≠⊸/ (1+·↕≠)⊸×(PossibleGame¨) d
+´idxs
