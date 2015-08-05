module Test.Main where

import Prelude

import TestHelpers
import SystemTest
import ObjectTest
import WebpageTest
import Test.Phantomjs.Object (exit)

main = phantomSpec do
  systemTest
  webpageTest
  -- objectTest
