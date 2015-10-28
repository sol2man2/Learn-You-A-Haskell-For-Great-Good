module Ch10 where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad

solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
  where
    foldingFunction (x:y:ys) "*" = (y*x):ys
    foldingFunction (x:y:ys) "+" = (y+x):ys
    foldingFunction (x:y:ys) "-" = (y-x):ys
    foldingFunction (x:y:ys) "/" = (y/x):ys
    foldingFunction (x:y:ys) "^" = (y**x):ys
    foldingFunction (x:xs) "ln" = log x:xs
    foldingFunction xs "sum" = [sum xs]
    foldingFunction xs numberString = read numberString:xs

main = putStrLn "Ch10!"
