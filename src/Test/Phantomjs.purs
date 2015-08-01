module Test.Phantomjs (
  File()
, PHANTOMJS()
, Timeout()
, Url()
) where

import Control.Monad.Eff

foreign import data PHANTOMJS :: !

type File = String
type Url = String
type Timeout = Int
