module WebpageTest (
  webpageTest
) where

import Prelude
import TestHelpers
import Test.Phantomjs
import qualified Test.Phantomjs.Webpage as W
import Control.Monad.Aff.Console
import Control.Monad.Eff.Class

main = phantomSpec do
  webpageTest

webpageTest = do
  "webpage module" #>: do
    page <- liftEff W.create
    W.open page "http://google.com"
    test "create" $ true
    test "open" $ true

    url <- liftEff $ W.url page
    test "url" $ url == "http://www.google.com/"
