module Main where

import Data.List
import Data.Char
import qualified Data.Map as Map

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
-- reverseWords = unwords . reverse . words

main = do
  line <- getLine
  if null line
    then return ()
    else do
      putStrLn $ reverseWords line
      main

