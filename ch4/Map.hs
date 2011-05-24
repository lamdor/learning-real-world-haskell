import Data.Char (toUpper)

upperCase :: String -> String
upperCase (x:xs) = toUpper x : upperCase xs
upperCase [] = ""

upperCase2 = map toUpper

myMap :: (a -> b) -> [a] -> [b]
myMap f (x:xs) = f x : myMap f xs
myMap _ _      = []