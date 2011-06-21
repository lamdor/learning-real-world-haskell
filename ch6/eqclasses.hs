import Data.Char (isSpace)

class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Bool where
    isEqual True True   = True
    isEqual False False = True
    isEqual _ _ = False

class BasicEq2 a where
    isEqual2 :: a -> a -> Bool
    isNotEqual2 :: a -> a -> Bool

class BasicEq3 a where
    isEqual3 :: a -> a -> Bool
    isEqual3 x y = not (isNotEqual3 x y)

    isNotEqual3 :: a -> a -> Bool
    isNotEqual3 x y = not (isEqual3 x y)

data Color = Red | Green | Blue

instance BasicEq3 Color where
    isEqual3 Red Red     = True
    isEqual3 Blue Blue   = True
    isEqual3 Green Green = True
    isEqual3 _ _         = False

instance Show Color where
    show Red   = "Red"
    show Blue  = "Blue"
    show Green = "Green"

instance Read Color where
    readsPrec _ value = tryParse colors
        where
          cleanedUpValue = dropWhile isSpace value
          tryParse [] = []
          tryParse ((attempt, result):xs) =
              if (take (length attempt) cleanedUpValue) == attempt
              then [(result, drop (length attempt) cleanedUpValue)]
              else tryParse xs
          colors = [("Red", Red), ("Green", Green), ("Blue", Blue)]
