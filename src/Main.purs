module Main where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Console

import Test.Phantomjs
import Test.Phantomjs.System
import Test.Phantomjs.Object
import Test.Phantomjs.Webpage
import Test.Phantomjs.Filesystem


main :: forall e. Eff ( phantomjs :: PHANTOMJS
                      , console :: CONSOLE | e) Unit
main = do
  args <- args
  print args
  page <- create
  content <- read "README.md"
  log content
  exit 0
