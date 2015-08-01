module Test.BrowserProcs where

import Prelude
import Test.Phantomjs
import Test.Phantomjs.Webpage

foreign import docTitle
  :: BrowserProc String

foreign import getIntX
  :: BrowserProc Int

foreign import setIntX
  :: Int
  -> BrowserProc Unit
