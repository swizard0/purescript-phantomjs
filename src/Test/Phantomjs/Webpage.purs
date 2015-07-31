module Test.Phantomjs.Webpage (
  Page()
, create
) where

import Control.Monad.Eff
import Test.Phantomjs

foreign import data Page :: *

foreign import create
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) Page
