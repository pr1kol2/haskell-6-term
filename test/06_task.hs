module Task06 where

import Control.Monad (ap, liftM)

data Dup a = Dup a a deriving (Eq, Show)

instance Functor Dup where
  fmap = liftM

instance Applicative Dup where
  pure x = Dup x x
  (<*>) = ap

instance Monad Dup where
  Dup x y >>= f = Dup x' y'
   where
    Dup x' _ = f x
    Dup _ y' = f y

{-
Dup хранит два поля.
pure кладет одно и то же значение в оба поля,
а >>= обрабатывает первое и второе поля отдельно.

1) pure x >>= h:
  если h x = Dup a b, то Dup x x >>= h = Dup a b = h x.

2) Dup x y >>= pure:
  pure x = Dup x x, pure y = Dup y y, значит результат Dup x y.

3) Ассоциативность проверяется по полям:
  первое поле обеих частей равно первому полю (g x >>= h),
  второе поле обеих частей равно второму полю (g y >>= h).
-}
