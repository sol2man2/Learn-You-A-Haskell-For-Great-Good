module Ch06 where

import Data.List
import Data.Char
import qualified Data.Map as Map
import Geometry
import Geometry.Sphere
import Geometry.Cube
import Geometry.Cuboid

numUnique :: (Eq a) => [a] -> Int
numUnique = length . nub

-- :m + Data.List
-- import Data.List
-- import Data.List (nub, sort)
-- import Data.List hiding (sort)
-- import qualified Data.Map
-- import qualified Data.Map as M

-- words "hey these are the words in this sentendce."
-- group [1,1,1,1,2,2,2,2,3,3,4,4,4,4,4,5,6,6,6,7,7,8]

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = 
  smallerOrEqual x xs ++ [x] ++ larger x xs
  where 
    smallerOrEqual y ys = qsort $ filter (<=y) ys
    larger y ys = qsort $ filter (>y) ys

wordNums :: String -> [(String, Int)]
wordNums = map (\ws->(head ws, length ws)) . group . sort . words
-- wordNums xs = map (\ws->(head ws, length ws)) . group . sort $ words xs
-- wordNums xs = map (\ws->(head ws, length ws)) $ group $ sort $ words xs

-- tails "party"
-- isPrefixOf "x" "xyz"
-- any (>4) [1,2,3]
isIn :: (Eq a) => [a] -> [a] -> Bool
isIn needle haystack = any (needle `isPrefixOf`) (tails haystack)

-- caesar cipher
-- ord 'a'
-- chr 97

encode :: Int -> String -> String
encode offset msg = map (\c-> chr $ ord c + offset) msg
-- encode offset msg = map (\-> chr . (+offset) . ord) msg

decode :: Int -> String -> String
decode offset msg = map (\c-> chr $ ord c - offset) msg

-- strict foldl
-- foldl (+) 0 (replicate 100000000 1)
-- foldl' (+) 0 (replicate 100000000 1)
-- digitToInt '2'
-- digitToInt 'F'

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

findTo40 :: Maybe Int
findTo40 = find (\x->digitSum x==40) [1..]

findTo :: Int -> Maybe Int
findTo n = find (\x->digitSum x==n) [1..]

-- association list
phoneBook = 
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("penny", "853-4292")]

-- findKey :: (Eq k) => k -> [(k,v)] -> v
-- findKey key xs = snd . head . filter (\(k,v)-> k==key) $ xs
-- -- findKey key xs = snd $ head $ filter (\(k,v)-> k==key) $ xs

-- findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
-- findKey key [] = Nothing
-- findKey key ((k,v):xs)
--   | key == k = Just v
--   | otherwise = findKey key xs

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
-- findKey key xs = foldr (\(k,v) acc->if(k == key) then Just v else acc) Nothing xs
findKey key xs = foldr (\x acc->if(fst x == key) then Just . snd $ x else acc) Nothing xs

-- Map.fromList [(3,"shoes"),(4,"trees"),(9,"bees")]
-- Map.fromList [("kima","greggs"),("jimmy","mcnulty"),("jay","landsman")]

-- Map.fromList [("MS",1),("MS",2),("MS",3)]

-- Map.fromList :: (Ord k) => [(k,v)] -> Map.Map k v

phoneBook' :: Map.Map String String
phoneBook' = Map.fromList $ 
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("penny", "853-4292")]

phoneBook1 = Map.insert "nature" "6696-4749"  phoneBook'

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

-- association list
phoneBook'' = 
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("patsy", "888-2475")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("wendy", "888-9090")
  ,("penny", "853-4292")]

phoneBookToMap :: (Ord k) => [(k,String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
  where add number1 number2 = number1 ++ ", " ++ number2

phoneBookToMap' :: (Ord k) => [(k,a)] -> Map.Map k [a]
phoneBookToMap' xs = Map.fromListWith (++) $ map (\(k,v)->(k,[v])) xs

-- phoneBookToMap' phoneBook''
-- Map.lookup "wendy" $ phoneBookToMap' phoneBook''

-- Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]

-- making module


main = putStrLn("Ch06!")
