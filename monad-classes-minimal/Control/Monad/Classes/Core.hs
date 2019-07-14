{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
module Control.Monad.Classes.Core where

import Data.Peano

type family CanDo (m :: * -> *) (eff :: k) :: Bool

type family MapCanDo (eff :: k) (stack :: * -> *) :: [Bool] where
  MapCanDo eff (t m) = CanDo (t m) eff ': MapCanDo eff m
  MapCanDo eff m = '[ CanDo m eff ]

type family FindTrue
  (bs :: [Bool])
  :: Peano
  where
  FindTrue ('True ': t) = 'Zero
  FindTrue ('False ': t) = 'Succ (FindTrue t)

type Find eff (m :: * -> *) =
  FindTrue (MapCanDo eff m)
