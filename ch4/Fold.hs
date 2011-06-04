foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _    zero []     = zero
foldl' step zero (x:xs) =
    let new = step zero x
    in new `seq` foldl' step new xs

foldr' :: (a -> b -> b)  -> b -> [a] -> b
foldr' step zero (x:xs) = step x (foldr' step zero xs)
foldr' _    zero []      = zero

filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs

myFilter p xs = foldr step [] xs
    where step x ys
              | p x       = x : ys
              | otherwise = ys

myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr step [] xs
    where step x ys = f x : ys

identity :: [a] -> [a]
identity xs = foldr (:) [] xs

append :: [a] -> [a] -> [a]
append xs ys = foldr (:) ys xs

strictPair (a, b) = a `seq` b `seq` (a,b)

strictList (x:xs) = x `seq` x : strictList xs
strictList [] = []