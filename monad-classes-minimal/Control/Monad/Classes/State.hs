{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
module Control.Monad.Classes.State where

import qualified Control.Monad.Trans.State.Lazy as SL
import Control.Monad.Classes.Core
import Control.Monad.Classes.Effects

type instance CanDo (SL.StateT s m) eff = StateCanDo s eff

type family StateCanDo s eff where
  StateCanDo s (EffReader s) = 'True
  StateCanDo s eff = 'False
