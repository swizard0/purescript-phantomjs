module TestHelpers (
  (#>)
, (#>:)
, phantomSpec
, test
, typeTest
, module Control.Monad.Eff.Class
) where

import Prelude
import Test.Spec
import Test.Spec.Runner
import Test.Spec.Reporter.Console
import Test.Spec.Assertions
import Control.Monad.Aff.Console
import Control.Monad.Eff.Class
import qualified Test.Phantomjs.Object as Phantom

(#>)  = describe
(#>:) = it

phantomSpec tests = run [consoleReporter] do
  tests
  liftEff $ Phantom.exit 0

-- This is a (possibly) temporary hack. We're running a feature test
-- with Phantom - except that Phantom is running *us* after we get
-- compiled. Because of this, we need to print our own output.
test desc cond = do
  log $ (if cond then "Success" else "FAILURE") ++ ": " ++ desc
  unit `shouldEqual` unit

typeTest desc value matchType = do
  pure $ value `asTypeOf` matchType
  log $ "Successfully typed: " ++ desc
  unit `shouldEqual` unit
