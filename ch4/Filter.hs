oddList :: [Int] -> [Int]
oddList (x:xs) | odd x     = x : oddList xs
               | otherwise = oddList xs
oddList _ = []

oddList2 xs = filter odd xs
