module Ch02 where

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r

-- :t head
-- :t fst

-- :t (==)

-- type variable, polymorphic fucntion
-- type class (interace)
-- instance
-- type signature
-- class constraint

-- Eq type class, == /=
5==5
5/=5
'a' == 'a'
"Ho Ho" == "Ho Ho"
3.432 == 3.432

-- Ord type class, <, <=, >, >=
-- :t (>)
-- "Abrakadabra" < "Zebra"
-- "Abrakadabra" `compare` "Zebra"
-- 5>=2
-- 5 `compare` 2

-- Show type class, to String
show 3
show 5.334
show True

-- Read type class, from String
read "True" || False
read "8.2" + 3.8
read "5" - 2
read "[1,2,3,4]" ++ [3]
-- :t read

-- type annotation, :: ?
read "5" :: Int
read "5" :: Float
(read "5" :: Float) * 4
read "[1,2,3,4]" :: [Int]
read "(3,'a')" :: (Int, Char)
[read "True", False, True, False]

-- Enum type class, succ, pred
['a'..'e']
[LT..GT]
[3..5]
succ 'B'

-- Bounded type class, minBound, maxBound
minBound :: Int
maxBound :: Char
maxBound :: Bool
minBound :: Bool
-- polymorphic constant

-- Num type class,
-- :t 20
20 :: Int
20 :: Integer
20 :: Float
20 :: Double

-- Float type class,

-- Integral type class,
fromIntegral (length [1,2,3,4]) + 3.2
