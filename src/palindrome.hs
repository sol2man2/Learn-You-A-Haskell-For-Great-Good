module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad

main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes =
  unlines .
  map (\xs->if isPal xs then "palindrome" else "not a palindrome.") .
  lines

isPal :: String -> Bool
isPal xs = xs == reverse xs


