module YukiPortfolio.Styles.MusicPlayer where

import Prelude hiding (top, bottom)

import CSS (CSS, border, byClass, height, pct, px, solid, star, width, zIndex, (&), (?))
import YukiPortfolio.Styles.Common (yukiColors)

style :: CSS
style = do
  star & byClass "musicPlayer" ? do
    width $ pct 100.0
    height $ px 120.0
    border solid (px 0.0) yukiColors.black
    zIndex 90