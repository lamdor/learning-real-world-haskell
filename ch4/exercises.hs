import Data.Char (digitToInt, isDigit)
    
safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just x
safeHead [] = Nothing

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (x:xs) = safeLast xs

safeInit    :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just $ init xs

splitWith       :: (a -> Bool) -> [a] -> [[a]]
splitWith f xs  = case break f xs of
                    ([], []) -> []
                    (xs2, []) -> [xs2]
                    ([], ys2) -> splitWith f (tail ys2)
                    (xs2, ys2) -> xs2 : splitWith f (tail ys2)
                            
splitWith2      :: (a -> Bool) -> [a] -> [[a]]
splitWith2 _ [] = []
splitWith2 f xs = let (xs2, ys2) = break f $ dropWhile f xs
                  in xs2 : splitWith2 f (dropWhile f ys2)

asInt_fold :: String -> Int
asInt_fold str = fst $ foldr step (0,0) str
    where step '-' (acc, digit)         = (-acc, digit + 1)
          step c (acc, digit)
                            | isDigit c = (acc + (10 ^ digit) * digitToInt c,
                                           digit + 1)
                            | otherwise = error ("not a digit " ++ [c])

type ErrorMessage = String
asInt_either :: String -> Either ErrorMessage Int
asInt_either str = fst $ foldr step (Right 0, 0) str
    where step '-' (Right acc, digit)   = (Right (-acc), digit + 1)
          step c (Right acc, digit)
                            | isDigit c = (Right (acc + (10 ^ digit) * digitToInt c),
                                           digit + 1)
                            | otherwise = (Left ("not a digit " ++ [c]), digit + 1)
          step _ (l, digit)        = (l, digit + 1)

concat_foldr :: [[a]] -> [a]
concat_foldr xs = foldr step [] xs
    where step ys result = ys ++ result

takeWhile_recur :: (a -> Bool) -> [a] -> [a]
takeWhile_recur pred xs = keep xs []
    where keep (x:xs') result | not (pred x) = result
          keep (x:xs') result                = keep xs' (result ++ [x])
          keep [] result                     = result

-- Not my original idea
takeWhile_foldr :: (a -> Bool) -> [a] -> [a]
takeWhile_foldr pred xs = foldr step [] xs
    where step x ys            | pred x    = x : ys
                               | otherwise = []
