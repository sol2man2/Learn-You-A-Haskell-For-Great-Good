module Main where

import Data.List
import Data.Char
-- import qualified Data.Map as Map
import Control.Monad
import System.IO
import System.Directory
import System.Environment
import Control.Exception

dispatch :: String -> [String] -> IO ()
dispatch "add" = add
dispatch "view" = view
dispatch "remove" = remove
dispatch command = doesntExist command

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")
add _ = putStrLn "The add command takes exactly two arguments."

view :: [String] -> IO ()
view [fileName] = do
  contents <- readFile fileName
  let
    todoTasks = lines contents
    numberedTasks = zipWith (\n line-> show n ++ " - " ++ line) [0..] todoTasks
  putStr $ unlines numberedTasks

remove :: [String] -> IO ()
remove [fileName, numberString] = do
  contents <- readFile fileName
  let
    todoTasks = lines contents
    numberedTasks = zipWith (\n line-> show n ++ " - " ++ line) [0..] todoTasks
  putStrLn "There are ur TO-DO items"
  mapM_ putStrLn numberedTasks
  let
    number = read numberString
    newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
  bracketOnError (openTempFile "." "temp")
    (\(tempName, tempHandle) -> do
      hClose tempHandle
      removeFile tempName)
    (\(tempName, tempHandle) -> do
      hPutStr tempHandle newTodoItems
      hClose tempHandle
      removeFile "todo.txt"
      renameFile tempName "todo.txt")

doesntExist :: String -> [String] -> IO ()
doesntExist command _ =
  putStrLn $ "The " ++ command ++ " command doesn't exist"

main = do
  (command:argList) <- getArgs
  dispatch command argList


