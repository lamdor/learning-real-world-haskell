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

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just $ init xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith f xs = case break f xs of
                   ([], []) -> []
                   (xs2, []) -> [xs2]
                   ([], ys2) -> splitWith f (tail ys2)
                   (xs2, ys2) -> xs2 : splitWith f (tail ys2)
                           
splitWith2 :: (a -> Bool) -> [a] -> [[a]]
splitWith2 _ [] = []
splitWith2 f xs = let (xs2, ys2) = break f $ dropWhile f xs
                  in xs2 : splitWith2 f (dropWhile f ys2)
             
