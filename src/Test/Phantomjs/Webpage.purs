module Test.Phantomjs.Webpage (
  Page()
, create
, open
, render
) where

import Prelude

import Control.Monad.Eff.Exception (Error())
import Control.Monad.Eff
import Control.Monad.Aff
import Test.Phantomjs

foreign import data Page :: *

foreign import create
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) Page



open :: forall e. Page -> String -> Aff (phantomjs :: PHANTOMJS | e) Unit
open page url = makeAff (\onError onSuccess -> _open
                                               onError
                                               (onSuccess unit)
                                               page
                                               url)

foreign import undefined :: forall a. a
-- _open = undefined

foreign import _open
  :: forall e.
     (Error -> Eff (phantomjs :: PHANTOMJS | e) Unit)
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
  -> Page
  -> String
  -> Eff (phantomjs :: PHANTOMJS | e) Unit


foreign import render
  :: forall e.
     Page
  -> File
  -> Eff (phantomjs :: PHANTOMJS | e) Unit
