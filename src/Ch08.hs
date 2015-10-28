module Ch08 where

import Data.List
import Data.Char
import qualified Data.Map as Map
import Control.Monad

-- main = do
--   _ <- putStrLn "Hello, what's your name?"
--   name <- getLine
--   putStrLn $ "Hey " ++ name ++ ", you rock!"

-- main = do
--   putStrLn "What's ur first name?"
--   firstName <- getLine
--   putStrLn "What's ur last name?"
--   lastName <- getLine
--   let 
--     bigFirstName = map toUpper firstName
--     bigLastName = map toUpper lastName
--   putStrLn $ "hey " ++ bigFirstName ++ " "
--              ++ bigLastName ++ ", how r u?"

-- main = do
--   return ()
--   return "HAHAHA"
--   line <- getLine
--   return "BLAH BLAH BLAH"
--   return 4
--   putStrLn $ line ++ "!"

-- main = do
--   a <- return "hell"
--   b <- return "yeah!"
--   putStrLn $ a ++ " " ++ b

-- main = do
--   let
--     a = "hell"
--     b = "yeah!"
--   putStrLn $ a ++ " " ++ b

-- useful IO function

-- main = do
--   putStr "Hey, "
--   putStr "I'm "
--   putStrLn "Andy!"
--   putChar 't'
--   putChar 'e'
--   putChar 'c'
--   putChar 'h'
--   putStrLn ""

-- main = do
--   print True
--   print 2
--   print "haha"
--   print 3.2
--   print [3,4,3]
--   putStrLn ""
--   putStrLn $ show True
--   putStrLn $ show 2
--   putStrLn $ show "haha"
--   putStrLn $ show 3.2
--   putStrLn $ show [3,4,3]

-- main = do
--   input <- getLine
--   when (input == "test") $ do
--     putStrLn input
--   input' <- getLine
--   if(input' ==  "huk")
--     then putStrLn input'
--     else return ()

-- main = do
--   a <- getLine
--   b <- getLine
--   c <- getLine
--   print [a,b,c]

-- main = do
--   rs <- sequence [getLine, getLine, getLine]
--   print rs
--   ss <- sequence $ map print [1,2,3,4,5]
--   return ()

-- main = do
--   mapM print [1,2,3]

-- main = do
--   mapM_ print [4,5,6]

-- main = forever $ do
--   putStr "Give me some input: "
--   l <- getLine
--   putStrLn $ map toUpper l

-- main = do
--   colors <- forM [1,2,3,4] (\a-> do
--     putStrLn $ "Which color do you associate with the number "
--       ++ show a ++ "?"
--     color <- getLine
--     return color)
--   putStrLn "The colors that you associate with 1,2,3 and 4 are: "
--   mapM putStrLn colors

-- main = do
--   colors <- forM [1,2,3,4] (\a-> do
--     putStrLn $ "Which color do you associate with the number "
--       ++ show a ++ "?"
--     getLine)
--   putStrLn "The colors that you associate with 1,2,3 and 4 are: "
--   mapM putStrLn colors

main = do
  colors <- mapM (\a-> do
    putStrLn $ "Which color do you associate with the number "
      ++ show a ++ "?"
    color <- getLine
    return color) [1,2,3,4]
  putStrLn "The colors that you associate with 1,2,3 and 4 are: "
  mapM putStrLn colors
