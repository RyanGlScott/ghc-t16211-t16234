# `ghc-t16211-t16234`

A minimal way to reproduce the bugs observed in GHC #16211 and #16234 that
incurs no dependencies (besides `transformers`, which is a GHC boot library).

## `ghc-t16211`

To reproduce the bug observed in GHC #16211, do the following:

1. Run `cabal new-build ghc-t16211`. This should successfully build.
2. Uncomment the `--x <- True` line and comment out the `let x = True` line in
   `ghc-t16211/Main.hs`.
3. Run `cabal new-build ghc-t16211`. This will (correctly) report a type error
   (`Couldn't match expected type 'IO Bool' with actual type 'Bool'`).
4. Delete the `x <- True` line and uncomment the `--let x = True` line in
   `ghc-t16211/Main.hs`.
5. Run `cabal new-build ghc-t16211`. This will incorrectly throw a
   `No instance for...` error.
6. Any subsequent invocations of `cabal new-build ghc-t16211` will report
   the same error as in step (5).

## `ghc-t16234`

To reproduce the bug observed in GHC #16234, simply run
`cabal new-build ghc-t16234`. Note that uncommenting the
`--import Control.Monad.Primitive ()` line in `ghc-t16234/Main.hs` will
make the error go away.
