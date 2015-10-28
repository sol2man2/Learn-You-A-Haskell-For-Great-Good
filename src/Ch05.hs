module Ch05 where

multThree :: Int -> Int -> Int -> Int
multThree x y z = x*y*z

-- let multTwoWithNine = multThree 9

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

compareWithHundred' :: Int -> Ordering
compareWithHundred' = compare 100

-- section
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- (/10) 200

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- print function

-- higher order
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- zipWith
zipWith' :: (a->b->c)->[a]->[b]->[c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- zipWith' (++) ["1","2","3"] ["5","6","7"]

flip' :: (a->b->c)->b->a->c
flip' f = g
  where g x y = f y x

flip'' :: (a->b->c)->b->a->c
flip'' f x y = f y x

-- zip [1,2,3,4,5] "hello"
-- flip' zip [1,2,3,4,5] "hello"
-- zipWith div [2,2..] [10,8,6,4,2]
-- zipWith (flip' div) [2,2..] [10,8,6,4,2]

-- toolbox for functional prgrammer
map' :: (a->b)->[a]->[b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a->Bool)->[a]->[a]
filter' _ [] = []
filter' p (x:xs)
  | p x == True = x: filter' p xs
  | otherwise = filter' p xs

-- filter'(<15) (filter' even [1..20])
-- [x|x<-[1..20], x<15, even x]

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
  let
    smallerOrEqual = filter (<=x) xs
    larger = filter (>x) xs
  in
    quicksort' smallerOrEqual ++ [x] ++ quicksort' larger

largestDivisible :: Integer
largestDivisible = head (filter' p [100000,99999..])
  where p x = x `mod` 3829 == 0

-- takeWhile(/=' ') "elephants know how to party"
-- sum (takeWhile (<10000) (filter' odd (map (^2) [1..])))
-- sum (takeWhile (<10000) [m|m<-[n^2|n<-[1..]], odd m])

-- Collatz sequence, Collatz chain
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n: chain (div n 2)
  | otherwise = n: chain (n*3+1)

numLongChains :: Int
numLongChains = length (filter' isLong (map chain [1..100]))
  where isLong xs = length xs > 15

-- several parameter & function mapping
-- let listOfFuns = map (*) [0..]

-- lambda
numLongChains' :: Int
numLongChains' = length (filter' (\xs-> length xs > 15) (map chain [1..100]))

-- zipWith' (\a b-> (a*30+3) / b) [5,4,3,2,1] [1,2,3,4,5]
-- map (\(a,b)-> a+b) [(1,2),(3,5),(6,3),(2,6),(2,5)]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x*y*z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z-> x+y+z

flip''' :: (a->b->c)->b->a->c
flip''' f = \x y -> f y x

-- zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]

-- fold
-- binary fold

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x->acc+x) 0 xs

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

map''' :: (a->b)->[a]->[b]
map''' f xs = foldl (\acc x->acc ++ [f x]) [] xs

elem' :: (Eq a) => a -> [a] -> Bool
elem' x xs = foldr (\y acc-> if y==x then True else acc) False xs

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

reverse' :: [a] -> [a]
reverse' xs = foldl (\acc x-> x:acc) [] xs

reverse'' :: [a] -> [a]
reverse'' xs = foldr (\x acc-> acc ++ [x]) [] xs

product' :: (Num a) => [a] -> a
product' = foldl (*) 1 

filter'' :: (a->Bool) -> [a] -> [a]
filter'' p xs = foldr f [] xs
  where f y acc = if p y then y:acc else acc

last' :: [a] -> a
last' xs = foldl1 (\_ x->x) xs

last'' :: [a] -> a
last'' xs = foldr1 (\_ acc->acc) xs

-- fold infinite list
and' :: [Bool] -> Bool
and' = foldr (&&) True

and'' :: [Bool] -> Bool
and'' = foldl (&&) True

-- scanl (+) 0 [3,5,2,1]
-- scanr (+) 0 [3,5,2,1]
-- scanl1 (\acc x->if x>acc then x else acc) [3,4,5,3,7,9,2,1]
-- scanl (flip (:)) [] [3,2,1]

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) +1

-- $, function application operator
-- left associative -> right associative

-- sum $ filter (>10) $ map (*2) [2..10]
-- map ($3) [(4+), (10*), (^2), (/2), (2^), (2/), sqrt]

-- function composition
-- map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

-- map (\xs->negate(sum(tail xs))) [[1..5],[3..6],[1..7]]
-- map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- point free style

main = putStrLn("Ch05!")

