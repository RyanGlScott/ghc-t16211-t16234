{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies     #-}

module Bar where

import Control.Monad.Classes (MonadReader)
import Control.Monad.Primitive
import Control.Monad.Trans.State.Lazy (StateT)

bar :: (n ~ StateT () IO, MonadReader () n) => IO ()
bar = undefined
