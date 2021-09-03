module YukiPortfolio.Style where

import Prelude
import CSS (CSS, byClass, display, flex, height, img, justifyContent, maxHeight, maxWidth, p, pct, spaceBetween, star, width, (&), (?), (|>))
import CSS.Common (auto)

style :: CSS
style = do
  star & byClass "musicPanel"
    ? do
        display flex
        justifyContent spaceBetween
  (star & byClass "musicPanel") |> p
    ? do
        width $ pct 30.0
  ((star & byClass "musicPanel") |> p) |> img
    ? do
        width auto
        height auto
        maxWidth $ pct 100.0
        maxHeight $ pct 100.0
