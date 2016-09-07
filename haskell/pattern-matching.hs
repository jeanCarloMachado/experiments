module PatternMatch where

    lucky :: (Integral a) => a -> String
    lucky 7 = "Lucky number"
    lucky x = "NOT lucky number"

    sayMe :: (Integral a) => a -> String  
    sayMe 1 = "One!"
    sayMe 2 = "Two!"
    sayMe 3 = "Three!"
    sayMe 4 = "Four!"
    sayMe 5 = "Five!"
    sayMe x = "Not between 1 and 5"

    factorial :: (Integral a) => a -> a
    factorial 0 = 1
    factorial n = n * factorial (n - 1)

    charName :: Char -> String  
    charName 'a' = "Albert"  
    charName 'b' = "Broseph"  
    charName 'c' = "Cecil"  

    addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
    addVectors (x1, y1) (x2, y2) = (x1 + x2,  y1 + y2)

    tell :: (Show a) => [a] -> String
    tell [] = "The list is empty"
    tell (x:[]) = "The list has one element x: " ++ show x
    tell (x:y:[]) = "The list has two elements x: " ++ show x ++ " and " ++  show y
    tell (x:y:_) = "The list has more than two elements"

    lenght' :: (Num b) => [a] -> b
    lenght' [] = 0
    lenght' (_:xs) = 1 + lenght' xs

