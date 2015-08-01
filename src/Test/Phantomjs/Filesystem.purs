module Test.Phantomjs.Filesystem (
  read
) where

import Control.Monad.Eff
import Test.Phantomjs


foreign import read
  :: forall e. File -> Eff ( phantomjs :: PHANTOMJS | e ) String
