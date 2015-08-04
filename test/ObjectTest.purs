module ObjectTest (
  objectTest
) where

import Prelude
import TestHelpers
import Test.Phantomjs
import qualified  Test.Phantomjs.Object as Phantom
import Data.Array
import Data.Maybe

main = phantomSpec do
  objectTest

objectTest = do
  "phantom object" #> do
    "version" #>: do
      version <- liftEff $ Phantom.version
      test "version" $ version.major == 2
    "cookies" #>: do
      cookies <- liftEff $ Phantom.getCookies
      -- test "cookies" $ cookies == []
      pure unit
    "addCookie" #>: do
      worked <- liftEff $ Phantom.addCookie $ Phantom.Cookie { name: "mycookie"
                                                     , value: "mycookievalue"
                                                     , domain: "mydomain.com"
                                                     }
      cookies <- liftEff $ Phantom.getCookies
      test "addCookie" $ worked == true
        -- &&
        -- (cookies !! 0 <#> Phantom.Cookie) == (Just $ Phantom.Cookie { name: "mycookie"
        --                                                             , value: "mycookievalue"
        --                                                             , domain: "mydomain.com"
        --                                                             })

    "deleteCookie" #>: do
      worked <- liftEff $ Phantom.deleteCookie "mycookie"
      test "deleteCookie" $ worked == true
      cookies <- liftEff $ Phantom.getCookies
      -- test "cookies" $ cookies == []
      pure unit

    "clearCookies" #>: do
      liftEff $ Phantom.clearCookies

    "cookiesEnabled" #>: do
      enabled <- liftEff $ Phantom.getCookiesEnabled
      test "enabled" $ enabled == true
