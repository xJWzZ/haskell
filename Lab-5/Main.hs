module Main where

main :: IO ()

-- takes in a value and the list in which to put
-- the value into.

-- List data type that mimics the [ ] data type
data List a = Empty | Cons { listHead :: a, listTail :: List a} deriving (Show, Read, Eq, Ord)

-- inserts an element into an ordered List
insert :: Ord a => a -> List a -> List a
insert x xs
  | xs == Empty = x `Cons` Empty
  | x < listHead xs = x `Cons` xs
  | otherwise = listHead xs `Cons` (insert x (listTail xs))

-- recreation of foldl implementation with new List data type
foldl' :: (a->b->a) -> a -> List b -> a
foldl' f z Empty = z
foldl' f z xs    = foldl' f (f z (listHead xs)) (listTail xs)

-- recreation of foldr implementation with new List data type
foldr' :: (a -> b -> b) -> b -> List a -> b
foldr' f z Empty = z
foldr' f z xs    = f (listHead xs) (foldr' f z (listTail xs))

-- Converts List to String interpretation of List
pretty_print :: (Show a) => List a -> [Char]
pretty_print Empty = "[]"
pretty_print xs    = "[" ++ (pretty_print_rec xs) ++ "]"

-- Recursive call that converts List elements to a String seperated
-- by a ', '
pretty_print_rec :: (Show a) => List a -> [Char]
pretty_print_rec Empty = ""
pretty_print_rec xs    = ( show (listHead xs)) ++ "," ++ (pretty_print_rec (listTail xs))

-- Converts elements from [ ] type into List type
create_from_list :: [a] -> List a
create_from_list [] = Empty
create_from_list xs = foldr (\x acc -> x `Cons` (acc)) Empty xs

main = putStrLn $ pretty_print $ create_from_list list
  where list = [1,2,3,5,4] :: [Int]
