module Test.Phantomjs.Webpage (
  BrowserProc()
, Page()
, Rect(..)
, RectObj()
, setClipRect
, getClipRect
, create
, evaluate0
, open
, openWithTimeout
, render
, url
) where

import Prelude

import Data.Function

import Control.Alt
import Control.Monad.Eff.Exception
import Control.Monad.Eff
import Control.Monad.Aff
import Control.Monad.Aff.AVar
import Control.Monad.Aff.Par
import Control.Monad.Error.Class
import Test.Phantomjs

-- | Represents a NON-closure procedure that will be run in the
-- | browser environment.
-- |
foreign import data BrowserProc :: * -> *

-- | An instance of Phantom's `webpage`.
-- |
foreign import data Page :: *

-- | Rectangular area of the web page to be rasterized when rendered.
-- |
type RectObj = { top :: Int, left :: Int, width :: Int, height :: Int }
newtype Rect = Rect RectObj

-- | Creates an instance of Phantom's `webpage`.
-- |
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

-- | Run a NON-closure procedure in the browser
-- | environment. `evaluateN` takes N arguments. Arguments must be
-- | JSON-serializable.
-- |
foreign import evaluate1
  :: forall e a b.
     Page
  -> (a -> BrowserProc b)
  -> a
  -> Eff (phantomjs :: PHANTOMJS | e) b

-- | Run a NON-closure procedure in the browser
-- | environment. `evaluateN` takes N arguments. Arguments must be
-- | JSON-serializable.
-- |
foreign import evaluate2
  :: forall e a b c.
     Page
  -> (a -> b -> BrowserProc c)
  -> a
  -> b
  -> Eff (phantomjs :: PHANTOMJS | e) c

-- | Run a NON-closure procedure in the browser
-- | environment. `evaluateN` takes N arguments. Arguments must be
-- | JSON-serializable.
-- |
foreign import evaluate3
  :: forall e a b c d.
     Page
  -> (a -> b -> c -> BrowserProc d)
  -> a
  -> b
  -> c
  -> Eff (phantomjs :: PHANTOMJS | e) d

-- | Opens a connection to the given URL.
-- |
open :: forall e. Page -> String -> Aff (phantomjs :: PHANTOMJS | e) Unit
open page url = makeAff (\onError onSuccess -> _open
                                               onError
                                               (onSuccess unit)
                                               page
                                               url)

foreign import _open
  :: forall e.
     (Error -> Eff (phantomjs :: PHANTOMJS | e) Unit)
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
  -> Page
  -> String
  -> Eff (phantomjs :: PHANTOMJS | e) Unit

-- | Opens a connection to the given URL, but may fail with a timeout.
-- |
openWithTimeout ::
  forall e. Page -> String -> Timeout -> Aff ( avar :: AVAR
                                             , phantomjs :: PHANTOMJS | e) Unit
openWithTimeout page url timeout =
  runPar $
  (Par $ pure unit) <|>
  (Par $ later' timeout (throwError $ timeoutError timeout))
  where
    timeoutError timeout = error $ "Timed out after " ++ show timeout ++ " seconds"

-- | Renders the page image to a file. File extension determines
-- | format. Accepts: PNG, GIF, JPEG, PDF.
-- |
foreign import render
  :: forall e.
     Page
  -> File
  -> Eff (phantomjs :: PHANTOMJS | e) Unit

-- | Gets the rectangular area of the web page to be rasterized when rendered.
-- |
getClipRect
  :: forall e.
     Page
  -> Eff (phantomjs :: PHANTOMJS | e) Rect
getClipRect page = _getClipRect page <#> Rect

foreign import _getClipRect
  :: forall e.
     Page
  -> Eff (phantomjs :: PHANTOMJS | e) RectObj

-- | Sets the rectangular area of the web page to be rasterized when rendered.
-- |
setClipRect
  :: forall e.
     Page
  -> Rect
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
setClipRect page (Rect rect) = runFn5 _setClipRect page rect.top rect.left rect.width rect.height

foreign import _setClipRect
  :: forall e.
     Fn5
     Page
     Int
     Int
     Int
     Int
     (Eff (phantomjs :: PHANTOMJS | e) Unit)

foreign import url
  :: forall e.
     Page
  -> Eff (phantomjs :: PHANTOMJS | e) String
