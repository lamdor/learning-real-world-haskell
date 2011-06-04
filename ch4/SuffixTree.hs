import Data.List

suffixes :: [a] -> [[a]]
suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _ = []

suffixes2 xs = init (tails xs)

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

suffixes3 xs = compose init tails xs

suffixes4 = compose init tails

suffixes5 = init . tails