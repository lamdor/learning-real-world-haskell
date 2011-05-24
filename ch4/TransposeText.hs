import Data.List(transpose)

main = interact transposeText

transposeText :: String -> String
transposeText = unlines . transpose . lines

