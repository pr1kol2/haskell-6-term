module Task05 where

import Data.List (nub)
import System.Random (StdGen, newStdGen, randomRs)

-- Итак, n шаров независимо бросаются в n урн.
-- В списке на i-ой позиции лежит номер урны, куда попал i-ый шар.
emptyBins :: Int -> [Int] -> Int
emptyBins n balls = n - length (nub balls)

twoEmptyBins :: Int -> [Int] -> Bool
twoEmptyBins n balls = emptyBins n balls == 2

randomBins :: Int -> StdGen -> [Int]
randomBins n gen = randomRs (0, n - 1) gen

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = first : chunksOf n rest
 where
  (first, rest) = splitAt n xs

estimatePnWithGen :: Int -> Int -> StdGen -> Double
estimatePnWithGen n experiments gen
  | n < 3 = error "estimatePnWithGen: n must be at least 3"
  | experiments <= 0 = error "estimatePnWithGen: experiments must be positive"
  | otherwise =
      fromIntegral good / fromIntegral experiments
 where
  throws = randomBins n gen
  trials = take experiments (chunksOf n throws)
  good = length [() | balls <- trials, twoEmptyBins n balls]

-- estimatePn n m оценивает p_n по m опытам.
estimatePn :: Int -> Int -> IO Double
estimatePn n experiments = do
  gen <- newStdGen
  return (estimatePnWithGen n experiments gen)
