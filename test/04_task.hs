module Task04 where

-- Для каждого ai выбираем bi из [0..ai].
-- mapM перебирает все независимые выборы и собирает их в списки.
lower :: [Int] -> [[Int]]
lower = mapM (\a -> [0..a])
