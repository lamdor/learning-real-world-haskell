module GlobRegex
    (
      globToRegex
    , matchesGlob
    )
where

import Text.Regex.Posix ((=~))
import Data.Char (toUpper, toLower)

globToRegex :: Bool -> String -> String
globToRegex caseS cs = '^' : globToRegex' caseS cs ++ "$"

globToRegex' :: Bool -> String -> String
globToRegex' _ "" = ""

globToRegex' caseS ('*':cs) = ".*" ++ globToRegex' caseS cs
                        
globToRegex' caseS ('?':cs) = "." ++ globToRegex' caseS cs

globToRegex' caseS ('[':'!':c:cs) = "[^" ++ (escape caseS c) ++ charClass caseS cs
globToRegex' caseS ('[':c:cs)     = '[' : (escape caseS c) ++ charClass caseS cs
globToRegex' _ ('[':_)        = error "unterminated character class"

globToRegex' caseS (c:cs) = escape caseS c ++ globToRegex' caseS cs

escape :: Bool -> Char -> String
escape caseS c | c `elem` regexChars = '\\' : [c]
               | caseS               = [c]
               | otherwise           = '(': (toUpper c) : '|' : (toLower c) : ")"
    where regexChars = "\\+()^$.{}]|"

charClass                :: Bool -> String -> String
charClass caseS (']':cs) = ']' : globToRegex' caseS cs
charClass caseS (c:cs)   = (escape caseS c) ++ charClass caseS cs
charClass _ []           = error "unterminated character class"

matchesGlob :: Bool -> FilePath -> String -> Bool
matchesGlob caseS name pat = name =~ globToRegex caseS pat

