{-
 - This file contains all the data about
 - the initial state of the puzzle as
 - well as some custom data and types
 - for helping with manipulating it.
 -}

module WheelData where

-- A space on a ring is either a gap or a printed number
data Slot = Gap | P Integer deriving(Eq) -- P for Printed

-- This defines how to do arithmetic on the Slot datatype
instance Num Slot where
  P a + P b = P (a + b) 
  fromInteger(a) = P a
  ---------------------
  P a * P b = P 0       --
  abs(P a) = P 0        -- These aren't used but they
  signum( P a) = P 0    -- prevent warnings if declared.
  negate( P a) = P 0    --

-- Defines the show function as only displaying the integer
-- part of the Slot. (To avoid printing tons of P's)
instance Show Slot where
  show(P a) = show(a)

-- A ring is a list of slots
type Ring = [Slot]

-- A wheel is a list of rings
type Wheel = [Ring]

-- The values of all other wheels are determined by the base
-- wheel because it has no gaps on it.
base_wheel = [[P 14, P 11, P 14, P 14, P 11, P 14, P 11, P 14, P 11, P 11, P 14, P 11],
              [P 13, P 12, P 11, P 10, P 9,  P 8,  P 7,  P 6,  P 5,  P 4,  P 15, P 14],
              [P 21, P 21, P 14, P 14, P 3,  P 3,  P 6,  P 6,  P 4,  P 4,  P 9,  P 9],
              [P 8,  P 16, P 7,  P 10, P 5,  P 2,  P 12, P 4,  P 3,  P 8,  P 8,  P 7]] :: Wheel
-- Wheel 1
one_wheel = [[Gap, P 9,  Gap,  P 7, P 2,  P 16, Gap,  P 8,  Gap,  P 11, P 14, P 7],
             [P 3, P 12, P 20, P 9, Gap,  P 9,  P 8,  P 3,  P 12, P 14, Gap,  P 6],
             [Gap, P 6,  P 26, P 3, P 12, P 3,  P 19, P 17, Gap,  P 9,  P 13, P 2],
             [Gap, P 9,  Gap,  P 1, Gap,  P 10, Gap,  P 10, Gap,  P 6,  Gap,  P 12]] :: Wheel
-- Wheel 2
two_wheel = [[Gap, P 5,  P 4,  P 17, P 21, P 13, P 7, P 9,  P 13, P 9,  P 8, P 7],
             [P 1, P 14, P 26, P 11, P 18, P 9,  P 4, P 15, P 6,  P 21, Gap, P 12],
             [Gap, P 16, Gap,  P 22, Gap,  P 8,  Gap, P 10, Gap,  P 5,  Gap, P 9]] :: Wheel
-- Wheel 3
three_wheel = [[P 6,  Gap, P 3, P 7, P 17, P 6,  Gap, P 11, P 6, P 11, P 11, Gap],
               [P 15, P 7, Gap, P 4, Gap,  P 12, Gap, P 9,  Gap, P 14, Gap, Gap]] :: Wheel
-- Wheel 4
four_wheel = [[Gap, P 3, Gap, P 8, Gap, P 15, Gap, P 7, Gap, P 10, Gap, P 6]] :: Wheel

--Defines the puzzle in one place to be solved
initPuzzle = [base_wheel, one_wheel, two_wheel, three_wheel, four_wheel]

