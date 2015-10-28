module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad
import System.IO
import System.Directory
import Control.Exception

-- main = do
--   contents <- readFile "todo.txt"
--   let 
--     todoTasks = lines contents
--     numberedTasks = zipWith (\n line-> show n ++ " - " ++ line)
--                             [0..] todoTasks
--   putStrLn "These are your TO-DO items"
--   mapM_ putStrLn numberedTasks
--   putStrLn "Which one do you want to delete?"
--   numberString <- getLine
--   let
--     number = read numberString
--     newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
--   (tempName, tempHandle) <- openTempFile "." "temp"
--   hPutStr tempHandle newTodoItems
--   hClose tempHandle
--   removeFile "todo.txt"
--   renameFile tempName "todo.txt"

main = do
  contents <- readFile "todo.txt"
  let 
    todoTasks = lines contents
    numberedTasks = zipWith (\n line-> show n ++ " - " ++ line)
                            [0..] todoTasks
  putStrLn "These are your TO-DO items"
  mapM_ putStrLn numberedTasks
  putStrLn "Which one do you want to delete?"
  numberString <- getLine
  let
    number = read numberString
    newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
  bracketOnError (openTempFile "." "temp")
    (\(tempName, tempHandle)-> do
      hClose tempHandle
      removeFile tempName)
    (\(tempName, tempHandle)-> do
      hPutStr tempHandle newTodoItems
      hClose tempHandle
      removeFile "todo.txt"
      renameFile tempName "todo.txt")
