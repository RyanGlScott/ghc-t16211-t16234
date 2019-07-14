{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Control.Monad.Classes.Reader where

import qualified Control.Monad.Trans.State.Lazy as SL
import Control.Monad.Classes.Core
import Control.Monad.Classes.Effects
import Control.Monad.Trans.Class
import Data.Peano

class Monad m => MonadReaderN (n :: Peano) (r :: *) m
instance Monad m => MonadReaderN 'Zero r (SL.StateT r m)
instance (MonadTrans t, Monad (t m), MonadReaderN n r m, Monad m)
  => MonadReaderN ('Succ n) r (t m)

type MonadReader e m = MonadReaderN (Find (EffReader e) m) e m
