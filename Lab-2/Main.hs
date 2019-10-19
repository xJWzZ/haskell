{-
- Name: Jack Wall.
- Number: 116397063.
- Assignment: 02.
-}

module Main where

main :: IO ()



replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x:replicate' (n-1) x

-- Lecture 11: Recursion
--  [] -> [[]]
--  [1] -> [[], [1]]
-- [2] -> [[], [1, 2]]
-- [1, 2] -> [[], [1], [1,2]]
-- [1,2,3] -> [[], [1], [1,2], [1,2,3]]

-- inits :: [a] -> [[a]]
-- inits [] = [[]]
-- inits (a:as) = []:[a:is
--                     | is <- init as
--                     ]
-- -- inits without list comprehensions
-- inits2 :: [a] -> [[a]]
-- inits2 = inits2' []
--
-- inits2' :: [a] -> [a] -> [[a]]
-- inits2' p [ ]   = [p]
-- inits2' p(a:as) = p : init' (p + [a]) as


-- inits in reverse order
reverseInits :: [a] -> [[a]]
reverseInits []     = [[]]
reverseInits (a:as) = as:reverseInits(reverseInits a)


-- concat [[1], [], [3,2]] -> [1,3,2]

concat' :: [[a]] -> [a]
concat' []       = []
concat' (as:ass) = as ++ concat' ass

group [1,2,1,3] -> [[1,1], [2], [3]]

group :: [a] -> [[a]]
group [] = []
group as = eqs:group nes
              where eqs = [a | a <- as a== head as]
                    nes = [a | a <- as, a /= head as]
--

change_paint :: [a] -> [a]
change_paint (a:as) = as:a

paint_internal_bricks :: [a] -> [[a]] -> [[a]]
-- call paint_wall on first item in list
-- call paint_internal_bricks on the remainder of list
paint_internal_bricks [] = []
paint_internal_bricks b (a:as) = paint_wall b a ++ paint_internal_bricks b as

paint_wall :: a -> [a] -> [a] -> [a]
--
paint_wall ind colours wall
  | ind == length wall -1 = wall
  | ind == 0 = wall
  | otherwise = change_paint ind colours wall

-- takes in the index, the colour, and the list and returns the list
paint_brick :: a -> a -> [a] -> [a]
paint_brick ind colour lst =


replaceValue :: Int -> a -> [a] -> [a]
replaceValue _ _ [] = []
replaceValue n newValue (a:as)
  | n == 0 = newVal:as
  | otherwise = x:replaceValue (n-1) newVal xs



main = do
  print(reverseInits [1,2,3,4])
