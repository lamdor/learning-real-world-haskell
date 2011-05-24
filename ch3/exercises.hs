myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + (myLength xs)

meanOfList :: Fractional a => [a] -> a
meanOfList [] = 0
meanOfList xs = (sum xs) / (fromIntegral $ length xs)

palindrome :: [a] -> [a]
palindrome xs = xs ++ (reverse xs)

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome xs | length xs == 1 = False
isPalindrome xs | head xs /= last xs = False
isPalindrome (x:xs) = isPalindrome $ init xs

                      