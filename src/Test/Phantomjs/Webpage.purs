module Test.Phantomjs.Webpage (
  BrowserProc()
, Page()
, create
, evaluate0
, open
, openWithTimeout
, render
) where

import Prelude

import Control.Alt
import Control.Monad.Eff.Exception
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.AVar
import Control.Monad.Aff.Par
import Control.Monad.Error.Class
import Test.Phantomjs

foreign import data BrowserProc :: * -> *

foreign import data Page :: *

foreign import create
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) Page


-- | Run a NON-closure procedure in the browser
-- | environment. `evaluateN` takes N arguments. Arguments must be
-- | JSON-serializable.
-- |
foreign import evaluate0
  :: forall e a.
     Page
  -> BrowserProc a
  -> Eff (phantomjs :: PHANTOMJS | e) a


open :: forall e. Page -> String -> Aff (phantomjs :: PHANTOMJS | e) Unit
open page url = makeAff (\onError onSuccess -> _open
                                               onError
                                               (onSuccess unit)
                                               page
                                               url)


openWithTimeout ::
  forall e. Page -> String -> Timeout -> Aff ( avar :: AVAR
                                             , phantomjs :: PHANTOMJS | e) Unit
openWithTimeout page url timeout =
  runPar $
  (Par $ pure unit) <|>
  (Par $ later' timeout (throwError $ timeoutError timeout))
  where
    timeoutError timeout = error $ "Timed out after " ++ show timeout ++ " seconds"

foreign import render
  :: forall e.
     Page
  -> File
  -> Eff (phantomjs :: PHANTOMJS | e) Unit


foreign import _open
  :: forall e.
     (Error -> Eff (phantomjs :: PHANTOMJS | e) Unit)
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
  -> Page
  -> String
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
