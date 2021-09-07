module YukiPortfolio.Styles.PictureViewer where

import Prelude

import CSS (CSS, absolute, backgroundColor, block, borderBox, boxSizing, byClass, display, flexGrow, fromString, height, img, marginLeft, marginRight, maxHeight, maxWidth, paddingBottom, paddingTop, pct, position, prefixed, px, relative, rgba, star, width, (&), (?))
import CSS.Common (auto)

style :: CSS
style = do
  star & byClass "pictureViewer" ? do
    position relative
    flexGrow 1.0
    prefixed (fromString "pointer-events") "none"
    star & byClass "viewing" ? do
      height $ pct 100.0
      width $ pct 100.0
      position absolute
      prefixed (fromString "pointer-events") "auto"
      backgroundColor $ rgba 255 255 255 0.6
      boxSizing borderBox
      paddingTop $ px 50.0
      paddingBottom $ px 50.0
      img ? do
        maxHeight $ pct 100.0
        maxWidth $ pct 100.0
        marginRight auto
        marginLeft auto
        height auto
        width auto
        display block