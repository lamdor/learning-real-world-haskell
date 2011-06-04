import Data.List(isInfixOf)

isInAny needle haystack = any inSequence haystack
    where inSequence s = needle `isInfixOf` s

isInAny2 needle haystack = any (\s -> needle `isInfixOf` s) haystack

isInAny3 needle haystack = any (isInfixOf needle) haystack

isInAny4 needle haystack = any (needle `isInfixOf`) haystack