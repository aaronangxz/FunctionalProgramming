twice = (\ n -> n + n)

main :: IO ()
main = do
    print "Hello, World!"
    print . twice $ twice 7 {- Chain print with . to avoid parantheses -}
    print $ twice $ twice 7 {- Chain print with $ , put values from right to left-}
-- Execute with `stack helloworld.hs`
-- OR
-- ghc -o hello helloworld.hs
-- ./hello