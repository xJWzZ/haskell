{-
- Name: Jack Wall.
- Number: 116397063.
- Assignment: 1.
-}

module Main where

main :: IO ()

-- A function that takes in a boolean, and outputs the same boolean
knight1 :: Bool -> Bool
knight1 q  = q

-- A function that inputs a boolean, and outputs the complement boolean
knave1 :: Bool -> Bool
knave1 q = not q

-- A function that takes in a boolean, and outputs the same boolean
-- using pattern matching
knight2 :: Bool -> Bool
knight2 q = q && True

-- A function that inputs a boolean, and outputs the complement boolean
-- using a lambda expression
knave2 :: Bool -> Bool
knave2 = \q -> not q

-- A function that inputs a boolean, and outputs the complement boolean
-- using a a partial application
knave3 :: Bool -> Bool
knave3 q = knave2 q

-- A function that takes no input, but returns a list of functions to call
inhabitants :: [Bool -> Bool]
inhabitants = [knight1, knight2, knave1, knave2, knave3]

-- A function that takes in an index, and produces the function
-- that corresponds to this index, within a list of functions
getInhabitant :: Int -> Bool -> Bool
getInhabitant i = inhabitants!!i

-- A function that receives an index to the corresponding function
-- within a list of functions, and a boolean, which will return the
-- value of the function output
ask :: Int -> Bool -> Bool
ask i b = getInhabitant i b

-- double_negation inverts a given Bool twice to result in the
-- original Bool
-- This function is not the equivalent to knavel.
-- This is because it complements the boolean twice, which
-- results in the original boolean being returned.
-- Knavel returns to complement boolean
double_negation :: Bool -> Bool
double_negation b = (knave1 . knave1) b

-- A function that receives a function, as well as a boolean,
-- and returns the true value of the output boolean, regardless
-- of the function
interrogate1 :: (Bool -> Bool) -> Bool -> Bool
interrogate1 f b = ((f b == b) || b) && b

-- A function that receives a function, as well as a boolean,
-- and returns the true value of the output boolean, regardless
-- of the function
interrogate2 :: (Bool -> Bool) -> Bool -> Bool
interrogate2 = (\f b -> ((f b == b) || b) && b)

-- A function that receives a function, as well as a boolean,
-- and returns the true value of the output boolean, regardless
-- of the function
interrogate3 :: Bool -> Bool
interrogate3 b = interrogate1 knight1 b



main = do
  print(interrogate2 knight1 True)
