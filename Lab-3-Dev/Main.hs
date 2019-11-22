{-
- Name: Jack Wall
- Number: 116397063
- Assignment: 03
-}
module Main where

main :: IO ()

-- function that returns true if the character given is a vowel
-- false otherwise
vowelCheck :: String -> Bool
vowelCheck v | (v == "a") = True
             | (v == "e") = True
             | (v == "i") = True
             | (v == "o") = True
             | (v == "u") = True
             | otherwise = False

-- takes in input line containing lowercase letters,
-- punctuation symbols, spaces and newlines
-- outputs line with word starting consonants translated to pig latin
consonant_translate :: String -> String
consonant_translate line = consonant_translate_rec line

-- recursive implementation of consonant_translate
consonant_translate_rec :: String -> String
consonant_translate_rec line
  | null line = line
  | not (null(fst (span (`elem` ['a'..'z']) line))) = (consonant_translate_word (fst (span (`elem` ['a'..'z']) line))) ++ consonant_translate_rec (snd (span (`elem` ['a'..'z']) line))
  | otherwise = (fst (span  ( `notElem` ['a'..'z']) line)) ++ consonant_translate_rec (snd (span  (`notElem`['a'..'z']) line))

-- takes in input line containing lowercase letters,
-- punctuation symbols, spaces and newlines
-- outputs line with word starting vowels translated to pig latin
vowel_translate :: String -> String
vowel_translate line
  | null line = line
  | not (null(fst (span (`elem` ['a'..'z']) line))) = (vowel_translate_word (fst (span (`elem` ['a'..'z']) line))) ++ vowel_translate (snd (span (`elem` ['a'..'z']) line))
  | otherwise = (fst (span  ( `notElem` ['a'..'z']) line)) ++ vowel_translate (snd (span  (`notElem`['a'..'z']) line))


-- translates whole line into pig latin
translate_both :: String -> String
translate_both line
  | null line = line
  | not (null(fst (span (`elem` ['a'..'z']) line))) = (wordChoice (fst (span (`elem` ['a'..'z']) line))) ++ translate_both (snd (span (`elem` ['a'..'z']) line))
  | otherwise = (fst (span  ( `notElem` ['a'..'z']) line)) ++ translate_both (snd (span  (`notElem`['a'..'z']) line))

-- calls appropriate function according to the starting letter
-- of word input
wordChoice :: String -> String
wordChoice (letter:letters)
  | vowelCheck [letter] = vowel_translate_word (letter:letters)
  | (letter `elem` ['a'..'z']) = consonant_translate_word (letter:letters)
  | otherwise = (letter:letters)

-- translate consonant word to pig latin
consonant_translate_word :: String -> String
consonant_translate_word (letter:letters)
  | vowelCheck [letter] = (letter:letters)
  | otherwise = consonant_translate_rec_word (letter:letters) ""

-- recursive function that moves initial consonant letters to end of word
-- and add 'ay' at end
consonant_translate_rec_word :: String -> String -> String
consonant_translate_rec_word (first_letter:rest_of_letters) add_on_letters
  | vowelCheck([first_letter]) = (first_letter:rest_of_letters) ++ add_on_letters ++ "ay"
  | null rest_of_letters = add_on_letters ++ [first_letter]
  | otherwise = consonant_translate_rec_word rest_of_letters (add_on_letters++[first_letter])

-- translate vowel word to pig latin
vowel_translate_word :: String -> String
vowel_translate_word (letter:letters)
  | not (vowelCheck [letter]) = (letter:letters)
  | otherwise = (letter:letters) ++ "way"

main = do
  line <- getLine
  putStrLn $ consonant_translate line
  putStrLn $ vowel_translate line
  putStrLn $ translate_both line
