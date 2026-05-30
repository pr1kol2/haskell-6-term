module Task03 where

{-
Ответ: X = scanl.

Действительно, inits [x1, ..., xn] = [[], [x1], [x1, x2], ..., [x1, ..., xn]].
После map (foldl f u) получаем [u, f u x1, f (f u x1) x2, ...], а это ровно определение scanl f u.
-}

x :: (b -> a -> b) -> b -> [a] -> [b]
x = scanl
