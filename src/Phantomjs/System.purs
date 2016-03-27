module Phantomjs.System (
  args
, env
, os
, pid
, platform
) where

import Control.Monad.Eff
import Phantomjs
import Data.StrMap

foreign import args
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) (Array String)

foreign import env
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) (StrMap String)

foreign import os
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) (StrMap String)

foreign import pid
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) Int

foreign import platform
  :: forall e. Eff (phantomjs :: PHANTOMJS | e) String
