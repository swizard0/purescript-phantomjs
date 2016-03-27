module Phantomjs (
  File()
, PHANTOMJS()
, Timeout()
, Url()
) where

import Control.Monad.Eff

-- | A computation that executes Phantom.js commands.
-- |
foreign import data PHANTOMJS :: !

type File = String
type Url = String
type Timeout = Int
