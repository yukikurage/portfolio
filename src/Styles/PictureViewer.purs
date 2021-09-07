module YukiPortfolio.Styles.PictureViewer where

import Prelude

import CSS (CSS, absolute, backgroundColor, block, borderBox, boxSizing, byClass, display, flexGrow, fromString, height, img, marginLeft, marginRight, maxHeight, maxWidth, paddingBottom, paddingTop, pct, position, prefixed, px, relative, rgba, star, width, (&), (?))
import CSS.Common (auto)
import YukiPortfolio.Styles.Common (fadeIn)

style :: CSS
style = do
  star & byClass "pictureViewer" ? do
    position relative
    flexGrow 1.0
    prefixed (fromString "pointer-events") "none"
    star & byClass "viewing" ? do
      fadeIn "viewing" $ px 0.0
      height $ pct 100.0
      width $ pct 100.0
      position absolute
      prefixed (fromString "pointer-events") "auto"
      backgroundColor $ rgba 0 0 0 0.7
      boxSizing borderBox
      paddingTop $ px 5.0
      paddingBottom $ px 5.0
      img ? do
        maxHeight $ pct 100.0
        maxWidth $ pct 100.0
        marginRight auto
        marginLeft auto
        height auto
        width auto
        display block