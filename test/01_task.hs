module Task01 where

toEither :: Maybe (a, Bool) -> Either (Maybe a) a
toEither Nothing = Left Nothing
toEither (Just (x, False)) = Left (Just x)
toEither (Just (x, True)) = Right x

fromEither :: Either (Maybe a) a -> Maybe (a, Bool)
fromEither (Left Nothing) = Nothing
fromEither (Left (Just x)) = Just (x, False)
fromEither (Right x) = Just (x, True)

{-
Типы изоморфны, потому что функции взаимнообратны:

toEither . fromEither = id
fromEither . toEither = id
-}
