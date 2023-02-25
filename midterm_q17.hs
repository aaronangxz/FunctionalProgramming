
data Expr a = Val a | Add (Expr a) (Expr a)
                    | Sub (Expr a) (Expr a)
                    | Mul (Expr a) (Expr a)

expr1 :: Expr Integer
expr1 = (Add (Val 1) (Val 2))

expr2 :: Expr Float
expr2 = (Add (Val 3.0) (Sub (Val 2.0) (Val 4.0)))

eval ::Num a => Expr a-> a
eval (Val v) = v
eval (Add v1 v2) = (eval v1) + (eval v2)
eval (Sub v1 v2) = (eval v1)-(eval v2)
eval (Mul v1 v2) = (eval v1) *(eval v2)

main :: IO ()
main = do
  print $ eval expr1