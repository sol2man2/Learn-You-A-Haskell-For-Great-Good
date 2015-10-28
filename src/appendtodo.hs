module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad
import System.IO

main = do
  todoItem <- getLine
  appendFile "todo.txt" (todoItem ++ "\n")
