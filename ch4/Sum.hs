mySum xs = helper 0 xs
    where helper acc (x:xs) = helper (acc + x) xs
          helper acc _      = acc

foldlSum xs = foldl step 0 xs
    where step acc x = acc + x

niceSum :: [Integer] -> Integer
niceSum xs = foldl (+) 0 xs

nicerSum :: [Integer] -> Integer
nicerSum = foldl (+) 0