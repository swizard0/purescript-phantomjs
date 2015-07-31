module Main where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console

import Test.Phantomjs
import Test.Phantomjs.System
import Test.Phantomjs.Object

main :: forall e. Eff ( phantomjs :: PHANTOMJS
                      , console :: CONSOLE | e) Unit
main = do
  args <- args
  print args
  exit 0
