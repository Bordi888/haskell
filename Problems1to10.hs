module Problems1to10 where
import Data.List (foldl')

-- Solutions for Problems 1-10

-- Problem 1
 
myLast :: [a] -> a
myLast = head . reverse

-- Problem 2

myButLast :: [a] -> a
myButLast = head . tail . reverse

-- Problem 3

elementAt :: Int -> [a] -> a
elementAt n = head . drop (n-1)

-- Problem 4

myLength :: [a] -> Int
myLength = foldl' (\n _ -> 1 + n) 0

-- Problem 5

reverseList :: [a] -> [a]
reverseList = foldl (flip (:)) []

-- Problem 6

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- Problem 7

data List a = Element a | List [List a]

flatten :: List a -> [a]
flatten (Element e) = [e]
flatten (List xs)   = concatMap flatten xs

-- Problem 8

compress :: Eq a => [a] -> [a]
compress = map head . groupDuplicates

-- Problem 9

groupDuplicates :: Eq a => [a] -> [[a]]
groupDuplicates []     = []
groupDuplicates (x:xs) = (x:duplicates) : groupDuplicates rest
                         where
                         (duplicates, rest) = span (x==) xs

-- Problem 10

encode :: Eq a => [a] -> [(Int, a)]
encode xs = map encodeElem (groupDuplicates xs)
            where
            encodeElem ys = (length ys, head ys)
