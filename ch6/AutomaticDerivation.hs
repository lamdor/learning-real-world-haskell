data CannotShow = CannotShow

data CannoDeriveShow = CannoDeriveShow CannotShow
                     deriving (Show)

data OK = OK

instance Show OK where
    show _ = "OK"

data ThisWOrks = ThisWorks OK
               deriving (Show)