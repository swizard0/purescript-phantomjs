module YCombinatorExample where

import Prelude
import Control.Monad.Aff
import Control.Monad.Eff.Class
import Control.Monad.Eff.Console
import Test.Phantomjs
import Test.Phantomjs.Object
import Test.Phantomjs.Webpage

main = do
  page <- create
  launchAff do
    open page "http://news.ycombinator.com"
    liftEff $ capture page

capture page = do
  setClipRect page $ Rect { top: 10, left: 35, width: 330, height: 500 }
  render page "hackernews.png"
  log "Success: screen captured."
  exit 0
