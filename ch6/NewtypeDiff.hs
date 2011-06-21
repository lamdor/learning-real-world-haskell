data TwoFields = TwoFields Int Int

newtype Okay = ExactlyOne Int

newtype Param a b = Param (Either a b)

newtype Record = Record {
      getInt :: Int
    }

-- newtype TooFew = TooFew
-- newtype ToManyFields = Fields Int Int
-- newtype TooManyCts = Bad Int
--     | Worse Int