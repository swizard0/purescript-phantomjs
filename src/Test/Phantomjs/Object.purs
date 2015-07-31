module Test.Phantomjs.Object (
  exit
) where

import Prelude
import Control.Monad.Eff
import Test.Phantomjs

foreign import exit
  :: forall e. Int -> Eff (phantomjs :: PHANTOMJS | e) Unit
