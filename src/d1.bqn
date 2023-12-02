#!/usr/bin/env cbqn

# -- Day 1 --
## - Part 1 -
d ← ⟨
  "1abc2"
  "pqr3stu8vwx"
  "a1b2c3d4e5f"
  "treb7uchet"
⟩
d ↩ •Flines"../data/d1.txt"
GetNum ← {•Bqn(⊏∾(¯1⊸⊏))(10>'0'-˜𝕩)/𝕩}
•Show +´GetNum¨d

## - Part 2 -
d2 ← ⟨
  "two2nine"
  "eightwothree"
  "abcone2threexyz"
  "xtwone3four"
  "4nineeightseven2"
  "zoneight234"
  "7pqrstsixteen"
⟩
d2 ↩ •Flines"../data/d1.txt"

GetNum2 ← {𝕊𝕩:
  dgs ← "one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
	dgsIdx ← 1+↕(≠dgs)
  repeatInput ← (≢dgs)⥊<𝕩
	wordNums ← +´dgsIdx×dgs(≢∘⊢↑⍷)¨repeatInput
	nums ← (10⊸>×⊢)'0'-˜𝕩
	removeZeroes ← {(∨`∧∨`⌾⌽)0≠𝕩}⊸/(nums+wordNums)
	•Bqn '0'+(⊏∾(¯1⊸⊏)) removeZeroes
}

•Show GetNum2 "abcone2threexyz"
+´GetNum2¨d2

