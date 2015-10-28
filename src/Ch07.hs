module Ch07 where

import Data.List
import Data.Char
import qualified Data.Map as Map

-- data Shape = Circle Float Float Float | 
--              Rectangle Float Float Float Float
--              deriving (Show)

-- area :: Shape -> Float
-- area (Circle _ _ r) = pi * r^2
-- area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- map (Circle 10 20) [4,5,6,6]

-- improve shapre with point 

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r^2
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b =
  Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

-- nudge (Circle (Point 24 24) 10) 5 10

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

-- nudge (baseCircle 10 ) 60 23

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

-- nudge (baseRect 40 100) 60 23

-- data Person = Person String String Int Float String String deriving (Show)

-- guy = Person "Buddy" "Finkestein" 43 184.2 "526-2928" "Chocolate"

-- firstName :: Person -> String
-- firstName (Person fname _ _ _ _ _) = fname

-- lastName :: Person -> String
-- lastName (Person _ lname _ _ _ _) = lname

-- age :: Person -> Int
-- age (Person _ _ a _ _ _) = a

-- height :: Person -> Float
-- height (Person _ _ _ h _ _) = h

-- phoneNumber :: Person -> String
-- phoneNumber (Person _ _ _ _ pnumer _) = pnumer

-- flavor :: Person -> String
-- flavor (Person _ _ _ _ _ f) = f

-- record syntax

-- data Person = Person {
--   firstName :: String,
--   lastName :: String,
--   age :: Int,
--   height :: Float,
--   phoneNumber :: String,
--   flavor :: String
-- } deriving (Show)

-- data Car = Car String String Int deriving (Show)

-- data Car = Car {
--   company :: String,
--   model :: String,
--   year :: Int
-- } deriving (Show)

-- tellCar :: Car -> String
-- tellCar (Car {company = c, model = m, year = y}) =
--   "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- stang = Car {company="Ford",model="Mustang", year=1967}

-- type parameter
data Maybe' a = Nothing' | Just' a

data IntMaybe = INothing | IJust Int
data StringMaybe = SNothing | SJust String
data ShapeMaybe = ShNothing | ShJust Shape

data Car a b c = Car {
  company :: a,
  model :: b,
  year :: c
} deriving (Show)

tellCar :: (Show a) => Car String String a -> String
tellCar (Car {company = c, model = m, year = y}) =
  "This " ++ c ++ " " ++ m ++ " was made in " ++ show y

-- stang = Car {company="Ford",model="Mustang", year=1967}
-- tellCar (Car "Ford" "Mustang" 1967)
-- tellCar (Car "Ford" "Mustang" "nineteen sixty seven")

-- data (Ord k) => Map k v = ...

data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
vplus (Vector i j k) (Vector l m n) = Vector (i+l) (j+m) (k+n)

dotProd :: (Num a) => Vector a -> Vector a -> a
dotProd (Vector i j k) (Vector l m n) = i*l + j*m + k*n

vmult :: (Num a) => Vector a -> a -> Vector a
vmult (Vector i j k) m = Vector (i*m) (j*m) (k*m)

-- type constructor, value constructor

-- derived instance

data Person =Person {
  firstName :: String,
  lastName :: String,
  age :: Int
} deriving (Eq, Show, Read)

-- mikeD = Person {firstName="Michael",lastName="Diamond",age=43}
-- adRock = Person {firstName="Adam",lastName="Horovitz",age=41}
-- mca = Person {firstName="Adam",lastName="Yauch",age=44}

-- mca == adRock
-- mikeD == adRock
-- mikeD == mikeD
-- mikeD == Person {firstName="Michael",lastName="Diamond",age=43}

-- mysteryDude = "Person { firstName=\"Michael\"" ++
--                         ", lastName=\"Diamond\"" ++
--                         ", age=43}"

-- mysteryDude = "Person { firstName=\"Michael\", lastName=\"Diamond\", age=43}"
-- read mysteryDude == mikeD

-- Ord
-- data Bool' = False' | True' deriving (Ord)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- type synonym
data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = 
  case Map.lookup lockerNumber map of
    Nothing -> 
      Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
    Just (state, code) -> 
      if state /= Taken
        then 
          Right code
        else 
          Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
  [(100,(Taken,"ZD39I"))
  ,(101,(Free,"JAH3I"))
  ,(103,(Free,"IQSA9"))
  ,(105,(Free,"QOTSA"))
  ,(109,(Taken,"893JJ"))
  ,(110,(Taken,"99292"))
  ]

-- lockerLookup 101 lockers

-- recursive data structure
-- data List a = Empty | Cons a (List a) 
--   deriving (Show, Read, Eq, Ord)

-- data List a = Empty | Cons {listHead :: a, listTail :: List a}
--   deriving (Show, Read, Eq, Ord)

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

-- 3 :-: 4 :-: 5 :-: Empty

infixr 5 ^++
(^++) :: [a] -> [a] -> [a]
[] ^++ ys = ys
(x:xs) ^++ ys = x: (xs ^++ ys)


infixr 5 ^^++
(^^++) :: List a -> List a -> List a
Empty ^^++ ys = ys
(x :-: xs) ^^++ ys = x :-: (xs ^^++ ys)

-- tree
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Ord, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a = Node a (treeInsert x left) right
  | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right) 
  | x == a = True
  | x < a = treeElem x left
  | x > a = treeElem x right

nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums

b1 = 8 `treeElem` numsTree
b2 = 9 `treeElem` numsTree

-- type class

-- class Eq a where
--   (==) :: a -> a -> Bool
--   (/=) :: a -> a -> Bool
--   x == y = not (x /= y)
--   x /= y = not (x == y)

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red light"
  show Green = "Green light"
  show Yellow = "Yellow light"

-- subclass
-- class (Eq a) => Num a where ...
-- instance Eq Maybe where ...
-- instance Eq (Maybe m) where ...

-- instance Eq (Maybe m) where
--   Just x == Just y = x == y
--   Nothing == Nothing = True
--   _ == _ = False

-- instance (Eq m) => Eq (Maybe m) where
--   Just x == Just y = x == y
--   Nothing == Nothing = True
--   _ == _ = False

-- error: (==) :: Maybe -> Maybe -> Bool
-- (==) :: (Eq m) => Maybe m -> Maybe m -> Bool

-- yes-no type class

class YesNo a where
  yesno :: a -> Bool

instance YesNo Int where
  yesno 0 = False
  yesno _ = True

instance YesNo [a] where
  yesno [] = False
  yesno _ = True

instance YesNo Bool where
  yesno = id

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

instance YesNo (Tree a) where
  yesno EmptyTree = False
  yesno _ = True

instance YesNo TrafficLight where
  yesno Red = False
  yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = 
  if yesno yesnoVal
    then yesResult
    else noResult

-- functor type class

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap = map

instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmpa f Nothing = Nothing

-- tree also functor
instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

-- either also functor
instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left x

-- kind
-- :k Int

main = putStrLn("Ch07!")
