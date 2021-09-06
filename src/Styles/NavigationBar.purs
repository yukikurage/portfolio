module YukiPortfolio.Styles.NavigationBar where

import Prelude hiding (top, bottom)

import CSS (CSS, a, absolute, background, backgroundColor, bottom, byClass, color, display, flex, flexStart, fontFamily, fontSize, fromString, height, inlineBlock, justifyContent, left, noneTextDecoration, opacity, paddingBottom, paddingLeft, paddingRight, paddingTop, pct, position, prefixed, px, relative, sansSerif, star, textDecoration, transitionDuration, width, (&), (?))
import Data.NonEmpty as NonEmpty
import YukiPortfolio.Styles.Common (changeOpacity, yukiColors)

style :: CSS
style = do
  star & byClass "navigationBar" ? do
    backgroundColor $ changeOpacity 0.8 yukiColors.greyYellow
    display flex
    paddingLeft $ px 10.0
    fontFamily ["Montserrat"] $ NonEmpty.singleton sansSerif
    justifyContent $ flexStart
    a ? do
      paddingRight $ px 12.0
      paddingLeft $ px 12.0
      paddingTop $ px 10.0
      paddingBottom $ px 10.0
      fontSize $ pct 140.0
      textDecoration $ noneTextDecoration
      position relative
      display inlineBlock
    fromString "a::after" ? do
      position absolute
      bottom $ px $ 6.0
      left $ px 0.0
      prefixed (fromString "content") "''"
      width $ pct 100.0
      height $ px 2.0
      background yukiColors.red
      opacity 0.0
      prefixed (fromString "visibility") "hidden"
      -- transition "transform" (sec 0.08) linear (sec 0.0)
      transitionDuration "0.1s"
    fromString "a:link" ? do
      color yukiColors.black
    fromString "a:visited" ? do
      color yukiColors.black
    fromString "a:hover" ? do
      color yukiColors.black
    fromString "a:hover::after" ? do
      opacity 1.0
      bottom $ px $ 1.0
      prefixed (fromString "visibility") "visible"
    fromString "a:active" ? do
      color yukiColors.black
    a & byClass "nowPage" ? do
      color yukiColors.red