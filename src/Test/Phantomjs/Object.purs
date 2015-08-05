module Test.Phantomjs.Object (
  Cookie(..)
, Version()
, addCookie
, clearCookies
, getCookies
, setCookies
, getCookiesEnabled
, setCookiesEnabled
, deleteCookie
, exit
-- , getLibraryPath
-- , setLibraryPath
, version
) where

import Prelude
import Control.Monad.Eff
import Test.Phantomjs

newtype Cookie r = Cookie { name :: String, value :: String, domain :: String | r }

type Version = { major :: Int, minor :: Int, patch :: Int }

foreign import addCookie
  :: forall e r.
     Cookie r
  -> Eff (phantomjs :: PHANTOMJS | e) Boolean

foreign import clearCookies
  :: forall e r.
     Eff (phantomjs :: PHANTOMJS | e) Unit

foreign import getCookies
  :: forall e r.
     Eff (phantomjs :: PHANTOMJS | e) (Array (Cookie r))

foreign import setCookies
  :: forall e r.
     Cookie r
  -> Eff (phantomjs :: PHANTOMJS | e) Unit

foreign import getCookiesEnabled
  :: forall e.
     Eff (phantomjs :: PHANTOMJS | e) Boolean

foreign import setCookiesEnabled
  :: forall e.
     Boolean
  -> Eff (phantomjs :: PHANTOMJS | e) Unit

foreign import deleteCookie
  :: forall e r.
     String
  -> Eff (phantomjs :: PHANTOMJS | e) Boolean

foreign import exit
  :: forall e. Int -> Eff (phantomjs :: PHANTOMJS | e) Unit

-- foreign import getLibraryPath
--   :: forall e. Eff (phantomjs :: PHANTOMJS | e) String

-- foreign import setLibraryPath
--   :: forall e.
--      String
--   -> Eff (phantomjs :: PHANTOMJS | e) Unit

-- Get Phantomjs version.
foreign import version
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) Version
