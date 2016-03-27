module Phantomjs.Filesystem (
  read
) where

import Control.Monad.Eff
import Phantomjs


foreign import read
  :: forall e. File -> Eff ( phantomjs :: PHANTOMJS | e ) String
