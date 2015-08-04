module SystemTest (
  systemTest
) where

import Prelude
import TestHelpers
import Test.Phantomjs
import qualified Test.Phantomjs.System as System
import Control.Monad.Aff.Console

main = phantomSpec do
  systemTest

systemTest = do
  "system module" #> do
    "args" #>: do
      args <- liftEff $ System.args
      test "system args" $ args == ["out.js"]
