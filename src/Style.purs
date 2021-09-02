module YukiPortfolio.Style where

import Prelude
import CSS (CSS, byClass, display, flex, justifyContent, p, pct, spaceBetween, star, width, (&), (?), (|>))

style :: CSS
style = do
  star & byClass "flex"
    ? do
        display flex
        justifyContent spaceBetween
  (star & byClass "flex") |> p
    ? do
        width $ pct 50.0
