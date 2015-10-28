module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad

-- main = forever $ do
--   l <- getLine
--   putStrLn $ map toUpper l

-- main = do
--   contents <- getContents
--   putStr $ map toUpper contents

-- main = do
--   contents <- getContents
--   putStr $ shortLinesOnly contents

-- main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line->length line < 10) . lines

main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes =
  unlines .
  map (\xs->if isPal xs then "palindrome" else "not a palindrome.") .
  lines

isPal :: String -> Bool
isPal xs = xs == reverse xs


