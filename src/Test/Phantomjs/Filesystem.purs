module Test.Phantomjs.Filesystem (
  File()
, read
) where

import Control.Monad.Eff
import Test.Phantomjs

type File = String

foreign import read
  :: forall e. File -> Eff ( phantomjs :: PHANTOMJS | e ) String
