{-
- Name: Jack Wall.
- Number: 116397063.
- Assignment: 02.
-}

module Main where

main :: IO ()

-- Takes in colours and walls and begins recursive function
paint_internal_bricks :: [a] -> [[a]] -> [[a]]
paint_internal_bricks colours walls = paint_wall colours walls colours

-- Takes in colours, walls, and the full list of colours.
-- For each wall, calls paint_bricks
paint_wall :: [a] -> [[a]] -> [a] -> [[a]]
paint_wall colours ((brick:bricks):walls) full_colours
  | null walls = [(brick:paint_bricks colours ((bricks):walls) full_colours)]
  | null bricks = ([brick] : paint_wall colours walls full_colours)
  | otherwise = ((brick:paint_bricks colours ((bricks):walls) full_colours) : paint_wall colours walls full_colours)

-- Takes in colours, walls, and list of all colours.
-- paints each internal brick recursively
paint_bricks :: [a] -> [[a]] -> [a] -> [a]
paint_bricks (colour:colours) ((first_brick:bricks):walls) full_colours
  | null colours = colour : paint_bricks full_colours ((bricks):walls) full_colours
  | null bricks = [first_brick]
  | otherwise = colour : paint_bricks colours ((bricks):walls) full_colours

main = putStrLn (show (paint_internal_bricks colours walls))
  where colours = [0,1,2]
        walls = [[3],[3,3],[3,3,3],[3,3,3],[3,3,3,3,3],[3,3,3,3,3,3]]
