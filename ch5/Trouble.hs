import Data.Char

upcaseFirst (c:cs) = toUpper c
    
upcaseFirst' :: String -> String
upcaseFirst' (c:cs) = (toUpper c) : cs

camelCase :: String -> String
camelCase xs = concat (map upcaseFirst' (words xs))