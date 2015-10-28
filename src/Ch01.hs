doubleMe x = x * x

doubleUs x y = x*x + y*y

doubleSmallNumber x = 
  if x > 100
  then x
  else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) +1

conanO'Brien = "It's a-me, Conan O'Brien!"

--let lostNumbers = [4, 8, 15, 16, 23, 42]

--[1, 2, 3, 4] ++ [9, 10, 11, 12]
--"hello" ++ " " ++ "world"
--['w', '0'] ++ ['o', 't']

--5:[1, 2, 3]

--"Steve Buscemi" !! 6

------------------------------------------------------
--List

--let b = [[1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3]]
--b ++ [[1,1,1,1]]

--[3,2,1] > [2,1,0]
--[3,2,1] > [2,10,100]
--[3,4,2] < [3,4,3]
--[3,4,2] > [2,4]
--[3,4,2] == [3,4,2]

--head [5,4,3,2,1]
--tail [5,4,3,2,1]
--last [5,4,3,2,1]
--init [5,4,3,2,1]

--length [5,4,3,2,1]

--null [1,2,3]
--null []

--reverse [5,4,3,2,1]

--take 3 [5,4,3,2,1]
--take 1 [5,4,3,2,1]
--take 5 [5,4]
--take 0 [5,4,3,2,1]

--drop 3 [8,4,2,1,5,6]
--drop 0 [1,2,3,4]
--drop 100 [1,2,3,4]

--maximum [1,9,2,3,4]
--minimum [1,9,2,3,4]

--sum [5,2,1,6,3,2,5,7]
--product [6,2,1,2]
--product [1,2,5,6,7,9,2,0]

--4 `elem` [3,4,5,6]
--10 `elem` [3,4,5,6]

------------------------------------------------------
--Scope

--[1..20]
--['a'..'z']
--['K'..'Z']

--[2,4..20]
--[3,6..20]

--[20,19..1]

--take 24 [13,26..]
--take 10 (cycle [1,2,3])
--take 10 (repeat 5)
--replicate 3 10

--[0.1, 0.3 .. 1]

------------------------------------------------------
--List Comprehansion

--[x*2 | x <- [1..10]]
--[x | x <- [50..100], x `mod` 7 ==3]

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
--let boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

--boomBangs [7..13]

--[x | x <- [10..20], x /= 13, x /= 15, x /= 19]
--[x+y | x <- [1,2,3], y <- [10,100,1000]]
--[x*y | x <- [2,5,10], y <- [8,10,11]]
--[x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
--removeNonUppercase "Hahaha~ Ahahaha!"
--removeNonUppercase "IdontLIKEFROGS"

xxs =[[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
--[[x | x <- xs, even x] | xs <- xxs]
--[x | xs <- xxs, x <- xs]

------------------------------------------------------
--Tuple
--(1,3)
--(3,'a',"hello")
--[(1,2),(8,11,5),(4,5)]

--fst(8,11)
--snd(8,11)

--zip [1,2,3,4,5] [5,5,5,5,5]
--zip [1..5] ["one", "two", "three", "four", "five"]
--zip [5,3,2,6,2,7,2,5,4,6,6] ["im", "a", "turtle"]
--zip [1..] ["apple", "orange", "cherry", "mango"]

triples = [(a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10]]
rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10], a^2 + b^2 == c^2]
rightTriangles' = [(a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10], a^2 + b^2 == c^2, a+b+c==24]
