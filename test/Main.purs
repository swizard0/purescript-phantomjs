module Main where

import Prelude

import TestHelpers
import SystemTest
import ObjectTest

main = phantomSpec do
  objectTest
  systemTest
