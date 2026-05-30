module Task02 where

-- На каждом шаге отбрасываем меньший из двух текущих элементов, пока не встретим равные.
haveCommon :: Ord a => [a] -> [a] -> Bool
haveCommon [] _ = False
haveCommon _ [] = False
haveCommon xs@(x:xt) ys@(y:yt)
  | x == y = True
  | x < y = haveCommon xt ys
  | otherwise = haveCommon xs yt

-- Каждый шаг уменьшает лишь один из списков, значит время работы O(n + m), где n и m — длины списков.
