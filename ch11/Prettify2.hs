module Prettify2 where

data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
           deriving (Show, Eq)

empty :: Doc
empty = Empty

(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y = x `Concat` y

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text ""  = Empty
text str = Text str

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
fold f = foldr f empty

hcat :: [Doc] -> Doc
hcat = fold (<>)

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p [] = []
punctuate p [d] = [d]
punctuate p (d:ds) = (d <> p) : punctuate p ds
