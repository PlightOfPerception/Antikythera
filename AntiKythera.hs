{- Solves a wooden puzzle consisting of numbered rotating
 - rings wherein the goal is to rotate all the rings such
 - that each radial column of numbers adds up to 42 -}

module AntiKythera where
import WheelData
 
correctSum = 42 -- Insert meaning of life joke here

-- Rotates a ring once to the left
rotateRing :: Ring -> Ring
rotateRing [] = []
rotateRing (x : xs) = xs ++ [x]

-- Rotates a whole wheel once to the left
rotateWheel :: Wheel -> Wheel
rotateWheel wheel = map rotateRing wheel

-- Rotates the puzzle once to the left accounting
-- for stepping up to the next wheel once the current
-- wheel has gone all the way around.
rotatePuzzle :: [Wheel] -> [Wheel]
rotatePuzzle [] = error "Might be no solutions, or the input data is wrong."
rotatePuzzle (x : xs)
  | (rotateWheel x) `elem` initPuzzle = (rotateWheel x) : (rotatePuzzle xs)
  | otherwise = (rotateWheel x) : xs

-- Combines a gapped ring with the full one below it
combineRing :: Ring -> Ring -> Ring
combineRing [] _ = []
combineRing (_ : xs) (P y : ys) = P y : combineRing xs ys
combineRing (P x : xs) (Gap : ys) = P x : combineRing xs ys

-- Uses the previous function to combine a completed wheel with a gapped one
combineWheel :: Wheel -> Wheel -> Wheel
combineWheel completed [] = completed
combineWheel (x : xs) (y : ys) = combineRing x y : combineWheel xs ys

-- Folds the previous function across the entire puzzle to 
-- produce a single wheel, essentially recreating the effect
-- of looking down on the puzzle from the top, viewing only
-- the visible numbers through all the gaps.
buildIter :: [Wheel] -> Wheel
buildIter wheels = foldl1 (combineWheel) wheels

{- This is actually some matrix rotation code I found here:
   https://stackoverflow.com/questions/34423279/rotate-a-matrix-in-haskell
  
   after realizing that due to the way I'd set up the wheels
   getting a list for each radial column of numbers just
   entailed looking at the list from a different angle -}
colIter :: Wheel -> Wheel 
colIter [] = []
colIter ([] : _) = []
colIter ring = map last ring : (colIter (map init ring))

-- Checks whether or not all of the given radial columns of
-- numbers each add up to 42.
checkIter :: Wheel -> Bool
checkIter [] = False
checkIter wheel = foldr (&&) True $ map (\x -> (sum x) == correctSum) wheel

-- Finds the puzzle solution by recursively calling itself
-- on the next rotation of the puzzle if the current one
-- is not valid.
solvePuzzle :: [Wheel] -> Wheel
solvePuzzle wheels
  | checkIter $ (colIter $ buildIter wheels) = colIter $ buildIter wheels
  | otherwise = solvePuzzle $ rotatePuzzle wheels

-- Program entry point
main :: IO ()
main = do
  let solution = solvePuzzle initPuzzle
  putStrLn $ "\nColumn A: " ++ (show $ solution!!0) 
         ++  "\n       B: " ++ (show $ solution!!1) 
         ++  "\n       C: " ++ (show $ solution!!2) 
         ++  "\n       D: " ++ (show $ solution!!3) 
         ++  "\n       E: " ++ (show $ solution!!4) 
         ++  "\n       F: " ++ (show $ solution!!5)
         ++  "\n       G: " ++ (show $ solution!!6)
         ++  "\n       H: " ++ (show $ solution!!7)
         ++  "\n       I: " ++ (show $ solution!!8)
         ++  "\n       J: " ++ (show $ solution!!9)
         ++  "\n       K: " ++ (show $ solution!!10)
         ++  "\n       L: " ++ (show $ solution!!11)
         ++  "\n\nViewing horizontally represents the solution values of"
         ++  "\nthe radial number columns and vertically represents the" 
         ++  "\nfinal values of the puzzle as concentric rings, where" 
         ++  "\nthe left most column is the inner most ring."
         ++  "\n(The solution image may be helpful)\n"
 
