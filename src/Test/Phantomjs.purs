module Test.Phantomjs (
  File()
, PHANTOMJS()
) where

import Control.Monad.Eff

foreign import data PHANTOMJS :: !

type File = String
