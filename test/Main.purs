module Test.Main where

import Prelude

import TestHelpers
import SystemTest
import ObjectTest
import Test.Phantomjs.Object (exit)

main = phantomSpec do
  systemTest
  objectTest
