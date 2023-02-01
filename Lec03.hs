x = 2
y = let x = 3 in x + 1
z = x + 5

foo 0 x = x
foo x y = foo (x - 1) (y + 1)

twice f x = f (f x)
triple x = 3 * x

{-
twice is a higher-order function that takes a function f and a value x as input, and applies f to x twice by calling f (f x).

triple is a simple function that takes a value x as input and returns 3 * x.

For example, to apply the triple function twice to 5, you could use twice as follows:

twice triple 5

This would evaluate to 3 * (3 * 5) = 3 * 15 = 45.
-}

add1 x = x + 1
times2 x = x * 2
f = add1 . times2

f1 = times2 . add1

{-
let x =
  let x = 5 in x * 2
in x + x

The outer let expression binds the value of x to the result of the inner let expression.

The inner let expression binds the value of x to 5, then calculates x * 2, so the value of the inner expression is 10.

The outer expression then calculates x + x, where x is bound to 10, so the final value of the expression is 10 + 10 = 20.

So after evaluating the code, we have x = 20
-}


{-
let x = 5 in
let f y = x + y in
  (f (f (x + 1)))

The code contains two nested let expressions. The outer let expression binds the value of x to 5.

The inner let expression defines a function f that takes a value y as input and returns the sum of x and y. Since x is in scope, f has access to its value of 5.

The expression (f (f (x + 1))) then calls the function f twice, first with x + 1, which is 6, and then with the result of the first call, which is 11.

So the expression evaluates to f (11), which is 5 + 11 = 16.

So after evaluating the code, we have x = 16
-}

foo1 0 y = y
foo1 x y = 1 + (foo1 (x - 1) (y * 2))

{-
foo is a recursive function that takes two arguments, x and y.

The first clause of the function defines the base case, where if x is 0, the function simply returns y.

The second clause defines the recursive case, where the function returns 1 + (foo (x - 1) (y * 2)). This means that foo will keep calling itself with x - 1 and y * 2 until x reaches 0.
-}

main :: IO ()
main = do
  print x
  print y
  print z
  print $ foo 3 5
  print $ twice triple 5
  print $ twice twice triple 5
  print $ f 3
  print $ f1 3
  print $ (foo1 4 1)
  {-
    foo 4 1
    = 1 + (foo 3 (1 * 2))
    = 1 + (1 + (foo 2 (2 * 2)))
    = 1 + (1 + (1 + (foo 1 (2 * 2 * 2))))
    = 1 + (1 + (1 + (1 + (foo 0 (2 * 2 * 2 * 2)))))
    = 1 + (1 + (1 + (1 + (2 * 2 * 2 * 2))))
    = 1 + (1 + (1 + (1 + 8)))
    = 1 + (1 + (1 + 9))
    = 1 + (1 + 10)
    = 1 + 11
    = 12
  -}