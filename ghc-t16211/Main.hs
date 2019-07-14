import Bar

main :: IO ()
main = do
  let x = True
  --x <- True
  foo x bar

foo :: Bool -> IO () -> IO ()
foo _ _ = undefined
