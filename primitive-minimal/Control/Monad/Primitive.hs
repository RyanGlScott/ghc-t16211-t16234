{-# LANGUAGE TypeFamilies #-}

-- |
-- Module      : Control.Monad.Primitive
-- Copyright   : (c) Roman Leshchinskiy 2009
-- License     : BSD-style
--
-- Maintainer  : Roman Leshchinskiy <rl@cse.unsw.edu.au>
-- Portability : non-portable
--
-- Primitive state-transformer monads
--
module Control.Monad.Primitive (PrimMonad(..)) where

import Control.Monad.Trans.State (StateT)

class Monad m => PrimMonad m where
  type PrimState m
instance PrimMonad m => PrimMonad (StateT s m) where
  type PrimState (StateT s m) = PrimState m
