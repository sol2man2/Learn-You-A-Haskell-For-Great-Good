module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad
import System.IO
import System.Directory
import System.Environment
import Control.Exception

main = do
  args <- getArgs
  progName <- getProgName
  putStrLn "The arguments are: "
  mapM putStrLn args
  putStrLn "The program name is: "
  putStrLn progName
