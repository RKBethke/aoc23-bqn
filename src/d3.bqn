#!/usr/bin/env cbqn

# -- Day 3 --
## - Part 1 -

# Any number adjacent to a symbol, even diagonally, is a "part number" and
# should be included in your sum.
# (Periods (.) do not count as a symbol.)
# What is the sum of all of the part numbers in the engine schematic?

d ← ⟨
  "467..114.."
  "...*......"
  "..35..633."
  "......#..."
  "617*......"
  ".....+.58."
  "..592....."
  "......755."
  "...$.*...."
  ".664.598.."
⟩
d ↩ •Flines"../data/d3.txt"
d >↩
dshape ← ≢d
dvec ← ⥊d

dgs ← '0'+↕10
IsNum ← ∊⟜dgs
numPos ← ×⟜{+` <˝˘2↕ 0∾𝕩} IsNum dvec # Number each string position.
nums ← •ParseFloat¨ 1↓numPos⊔dvec

sym ← ¬ (('.'⊸=) ∨ IsNum) d

# Reminiscent of Conway's Game of Life.
m ← 0≠·+´⥊¯1‿0‿1 (⌽⎉1)⌜ ¯1‿0‿1 ⌽⌜ <sym
validNumIds ← ⍷0⊸<⊸/numPos×⥊m
+´(validNumIds-1)⊏nums

## - Part 2 -

# A gear is any * symbol that is adjacent to exactly two part
# numbers. Its gear ratio is the result of multiplying those
# two numbers together.
# What is the sum of all of the gear ratios in your engine
# schematic?
# gear ← '*'=d

# Iterate with 3x3 window. On each point, if * and 2 distinct numbers, return gear ratio.
# Plus reduce final array.

