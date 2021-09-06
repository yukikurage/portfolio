module YukiPortfolio.Styles.Common where

import Prelude hiding (top)

import CSS (AnimationName(..), CSS, Color, animation, ease, forwards, iterationCount, keyframesFromTo, normalAnimationDirection, opacity, position, px, relative, rgba, sec, toRGBA, top, value)
import Color (rgb)

yukiColors :: {
  black :: Color,
  greyYellow :: Color,
  red :: Color
}
yukiColors = {
  red: rgb 168 35 62,
  greyYellow: rgb 245 241 231,
  black: rgb 50 50 50
}

changeOpacity :: Number -> Color -> Color
changeOpacity op col = rgba ex.r ex.g ex.b op
  where
  ex = toRGBA col

fadeIn :: String -> CSS
fadeIn id = do
  keyframesFromTo ("fadeIn" <> id)
    do
      position relative
      top $ px $ - 5.0
      opacity 0.0
    do
      position relative
      top $ px 0.0
      opacity 1.0
  animation
    (AnimationName $ value $ "fadeIn" <> id)
    (sec 0.2)
    ease
    (sec 0.0)
    (iterationCount 1.0)
    normalAnimationDirection forwards