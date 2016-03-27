module Phantomjs.ChildProcess (
  ChildProcess()
, Command()
, Arg()
, spawn
) where

import Control.Monad.Eff
import Phantomjs

foreign import data ChildProcess :: *

type Command = String
type Arg = String

foreign import spawn
  :: forall e.
     Command
  -> Array Arg
  -> Eff (phantomjs :: PHANTOMJS | e) ChildProcess
