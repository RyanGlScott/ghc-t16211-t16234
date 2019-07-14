{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies     #-}

import Control.Monad.Classes (MonadReader)
--import Control.Monad.Primitive ()
import Control.Monad.Trans.State.Lazy (StateT)

main :: (n ~ StateT () IO, MonadReader () n) => IO ()
main = undefined
