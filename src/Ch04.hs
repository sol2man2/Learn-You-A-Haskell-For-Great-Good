module Ch04 where

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs) 

replicate' :: Int -> a -> [a]
replicate' n x 
  | n <= 0 = []
  | otherwise = x: replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' i (x:xs)
  | i <= 0 = []
  | otherwise = x: take' (i-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x: repeat' x

zip' :: [a] -> [a] -> [(a,a)]
zip' (x:xs) [] = []
zip' [] (y:ys) = []
zip' (x:xs) (y:ys) = (x,y): zip' xs ys

elem' :: Eq a => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
  | a == x = True
  | otherwise = elem' a xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = let
                     smallOrEqual = [a| a<-xs, a<=x]
                     larger = [a| a<-xs, a>x]
                   in
                     quicksort smallOrEqual ++ [x] ++ quicksort larger

main = putStrLn("Ch04!")
