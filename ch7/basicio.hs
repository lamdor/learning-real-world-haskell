main = do
  putStrLn "Greeting! What is your name?"
  inpStr <- getLine
  putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!"