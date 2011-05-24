import System.Environment (getArgs)

main = interact myFunction
    where myFunction = unlines . fmap firstWord . lines

firstWord :: String -> String
firstWord s = case words s of
                [] -> []
                xs -> head xs

