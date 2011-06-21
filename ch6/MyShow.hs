class MyShow a where
    show' :: a -> String
    showList' :: [a] -> String

instance MyShow Int where
    show' = show
    showList' = (flip showList) ""

instance MyShow Char where
    show' = show
    showList' = id

instance MyShow a => MyShow [a] where
    show' = showList'
    showList' = undefined