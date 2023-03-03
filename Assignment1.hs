import Debug.Trace (trace)
{-
  Q1
  Write an efficient Fibonacci function by using tuples as its input parameter similar to our improvement of factorial function using tuple.
-}

fib :: (Integer, Integer, Integer) -> Integer
-- Write your implementation of fib below using declarative style
fib (a, b, c)
  | a == 0 = b
  | a == 1 = c
  | otherwise = fib (a-1, c, b+c)

-- Uncomment to test
--fib (0,0,1)   -- should return 0
--fib (3,0,1)   -- should return 2
--fib (8,0,1)   -- should return 21


{-
  Q2
  TreeData where data resides in the branch as opposed to the leaf
-}

-- Q2A: Create a data called "TreeData"


-- Q2B: Extend the Functor typeclass to include "TreeData" as a member


-- Q2C: Write the function "largest" to find the largest value in the tree.

-- max' Nothing  Nothing  = Nothing
-- max' x        Nothing  = x
-- max' Nothing  y        = y
-- max' (Just x) (Just y) = if x > y then (Just x) else (Just y)

-- largest :: TreeData Integer -> Maybe Integer

-- Uncomment to test
--tree :: TreeData Integer
--tree = Branch 1 (Branch 2 Leaf (Branch 4 Leaf Leaf)) (Branch 3 Leaf Leaf)
-- largest tree   -- (Just 4)
-- largest Lead   -- Nothing





{-
  Q3
  Write the infinite list of Tribonacci numbers called "trib_list"
-}

-- trib_list :: [Integer]





{-
  Q4
  Lambda Calculus
-}

-- Q2A: Create a data called "Term" to represent lambda calculus


-- Q2B: Add the data "Term" as a member to "Show" typeclass by implementing the "show" function

-- Uncomment to test
--term1 = App (Var "y") (Var"x")            -- (y x)
--term2 = Lam "y" (App (Var "x") (Var "x")) -- (\y . (x x)) (i.e., lambda y)
--show term1  -- (y x)
--show term2  -- (\y . (x x))

main :: IO ()
main = do
  print $ fib (0,0,1)   -- should return 0
  print $ fib (3,0,1)   -- should return 2
  print $ fib (8,0,1)   -- should return 21