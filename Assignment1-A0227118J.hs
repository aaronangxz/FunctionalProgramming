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

{-
  Q2
  TreeData where data resides in the branch as opposed to the leaf
-}

-- Q2A: Create a data called "TreeData"
data TreeData a = Leaf | Branch a (TreeData a) (TreeData a)

-- Q2B: Extend the Functor typeclass to include "TreeData" as a member
instance Functor TreeData where
  fmap f Leaf = Leaf
  fmap f (Branch x left right) = Branch (f x) (fmap f left) (fmap f right)

-- Q2C: Write the function "largest" to find the largest value in the tree.

max' Nothing  Nothing  = Nothing
max' x        Nothing  = x
max' Nothing  y        = y
max' (Just x) (Just y) = if x > y then Just x else Just y

largest :: TreeData Integer -> Maybe Integer
largest Leaf = Nothing
largest (Branch x left right) = max' (Just x) (max' (largest left) (largest right))

-- Uncomment to test
tree :: TreeData Integer
tree = Branch 1 (Branch 2 Leaf (Branch 4 Leaf Leaf)) (Branch 3 Leaf Leaf)

{-
  Q3
  Write the infinite list of Tribonacci numbers called "trib_list"
-}

trib_list :: [Integer]
trib_list = [0, 1, 1] ++ zipWith3 (\x y z -> x + y + z) trib_list (tail trib_list) (drop 2 trib_list)


{-
  Q4
  Lambda Calculus
-}

-- Q2A: Create a data called "Term" to represent lambda calculus
data Term
  = Var String
  | Lam String Term
  | App Term Term

-- Q2B: Add the data "Term" as a member to "Show" typeclass by implementing the "show" function
instance Show Term where
  show (Var x) = x
  show (Lam x t) = "(\\" ++ x ++ " . " ++ show t ++ ")"
  show (App t1 t2) = "(" ++ show t1 ++ " " ++ show t2 ++ ")"

-- Uncomment to test
term1 = App (Var"y") (Var"x")            -- (y x)
term2 = Lam "y" (App (Var"x") (Var"x")) -- (\y . (x x)) (i.e., lambda y)


main :: IO ()
main = do
  print $ fib (0,0,1)   -- should return 0
  print $ fib (3,0,1)   -- should return 2
  print $ fib (8,0,1)   -- should return 21
  print $ largest tree   -- (Just 4)
  print $ largest Leaf   -- Nothing
  print $ take 10 trib_list -- should return [0, 1, 1, 2, 4, 7, 13, 24, 44, 81]
  print $ show term1  -- (y x)
  print $ show term2  -- (\y . (x x))