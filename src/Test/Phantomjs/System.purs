module Test.Phantomjs.System (
  args
) where

import Control.Monad.Eff
import Test.Phantomjs

foreign import args
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) (Array String)
