{- AntiKythera Tests:
 -
 - This file contains a few tests to make sure I was 
 - headed in the right direction. They are incomplete.
 -}

-- NOTE:
-- This testing code was borrowed from
-- Dr. Lam @ JMU and tweaked to suit
-- this program's functions. A majority
-- of the driving code towards the bottom
-- is directly copied.

module Main where
import AntiKythera hiding (main) -- AntiKythera's main clashes with test's
import WheelData

testRotateRing =
  [(rotateRing [Gap, P 3, Gap])     == [P 3,Gap,Gap],
   (rotateRing [P 3, P 1, P 2])     == [P 1, P 2, P 3],
   (rotateRing [])                  == []]

testCombineRing =
  [(combineRing [P 2, P 5, P 4] [Gap, P 3, Gap])     == [P 2,P 3,P 4],
   (combineRing [P 2, P 5, P 4] [P 3, P 1, P 2])     == [P 3,P 1,P 2]]

testColIter =
  [(colIter [[P 1, P 4, P 7],[P 2, P 5, P 8],[P 3, P 6, P 9]]) 
             == [[P 7, P 8, P 9],[P 4, P 5, P 6],[P 1, P 2, P 3]],
    colIter [] == []]

testCheckIter = -- Lists need to add up to 42
  [(checkIter [[P 40, P 1, P 1],[P 39, P 1, P 2],[P 7,P 7,P 7,P 7,P 7,P 7]])     == True,
   (checkIter [[P 44, P 1, P 1],[P 34, P 1, P 2],[P 3,P 7,P 7,P 7,P 7,P 7]])     == False,
   (checkIter [[P 38, P 1, P 1],[P 35, P 1, P 2],[P 4,P 7,P 7,P 7,P 7,P 7]])     == False,
   (checkIter [[P 40, P 1, P 2],[P 39, P 1, P 5],[P 7,P 7,P 9,P 7,P 7,P 7]])     == False,
   (checkIter [])     == False]

testAll = testRotateRing  ++ testCombineRing  ++ testColIter ++ testCheckIter

countCorrect []         = 0
countCorrect (True:xs)  = 1 + (countCorrect xs)
countCorrect (False:xs) =     (countCorrect xs)

buildRatioStr results =
  let correct = countCorrect results
      total   = length results
  in (show correct) ++ "/" ++ (show total)

calcRatio results =
  let correct = countCorrect results
      total   = length results
  in truncate $ (fromIntegral correct) / (fromIntegral total) * 100.0

summarize results =
  let key = map (\t -> if t then '.' else 'X') results
  in (buildRatioStr results) ++ "   " ++ key

main = do
  let allTestResults = testAll
  let result = "  rotateRing:  " ++ (summarize testRotateRing)     ++ "\n" ++
               "  combineRing: " ++ (summarize testCombineRing) ++ "\n" ++
               "  colIter:     " ++ (summarize testColIter) ++ "\n" ++
               "  checkIter:   " ++ (summarize testCheckIter) ++ "\n" ++
               "  TOTAL:       " ++ (buildRatioStr allTestResults)     ++ "\n" ++
               "  " ++ (show $ calcRatio allTestResults) ++ "% passed"
  putStrLn $ "\n" ++ result

