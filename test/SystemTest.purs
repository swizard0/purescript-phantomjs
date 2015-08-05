module SystemTest (
  systemTest
) where

import Prelude
import TestHelpers
import Test.Phantomjs
import qualified Test.Phantomjs.System as System
import Control.Monad.Aff.Console
import qualified Data.StrMap as M
import qualified Data.List as L
import qualified Data.Tuple as T


main = phantomSpec do
  systemTest

systemTest = do
  "system module" #> do
    "args" #>: do
      args <- liftEff $ System.args
      typeTest "system args" args ["out.js"]
    "env" #>: do
      env <- liftEff $ System.env
      typeTest "system env" env (M.fromList $
        T.Tuple "foo" "bar" L.:
        T.Tuple "baz" "qux" L.:
        L.Nil)
    "os" #>: do
      os <- liftEff $ System.os
      typeTest "system os" os (M.fromList $
        T.Tuple "foo" "bar" L.:
        T.Tuple "baz" "qux" L.:
        L.Nil)
    "pid" #>: do
      pid <- liftEff $ System.pid
      typeTest "system pid" pid 1234
    "platform" #>: do
      platform <- liftEff $ System.platform
      test "system platform" $ platform == "phantomjs"
