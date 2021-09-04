module YukiPortfolio.Components.StyleSheet where

import Prelude

import CSS (CSS, a, background, backgroundColor, backgroundRepeat, black, bold, border, borderTop, bottom, byClass, color, cursor, display, fixed, flex, flexBasis, flexGrow, flexShrink, flexWrap, fontFaceFamily, fontSize, fontWeight, footer, fromString, height, img, justifyContent, left, main, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minWidth, noRepeat, paddingLeft, paddingRight, paddingTop, pct, position, px, query, rgb, solid, spaceBetween, star, url, width, wrap, (&), (?))
import CSS.Common (auto)
import CSS.Common as Common
import CSS.Cursor (pointer)
import CSS.Media (screen)
import CSS.Media as CMedia
import CSS.TextAlign (center, textAlign)
import Color.Scheme.MaterialDesign (grey)
import Data.NonEmpty as NonEmpty
import Halogen as H
import Halogen.HTML.CSS as HC
import Halogen.Hooks as Hooks

style :: CSS
style = do
  star & byClass "musicPanels" ? do
    maxWidth $ px 1000.0
    minWidth $ px 250.0
    marginLeft auto
    marginRight auto
    paddingTop $ px 20.0
    display flex
    flexWrap wrap
    justifyContent spaceBetween
  star & byClass "musicPanel" ? do
    width $ pct $ 100.0 / 4.0
    textAlign center
    img ? do
      height auto
      width $ pct 100.0
      maxHeight $ pct 100.0
      cursor pointer
      background $ url "./public/images/loading_black.gif"
      backgroundRepeat $ noRepeat
      backgroundColor $ rgb 207 207 207
  star & byClass "musicPanelInner" ? do
    paddingLeft $ px 6.0
    paddingRight $ px 6.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 1000.0) do
    star & byClass "musicPanel" ? do
      width $ pct $ 100.0 / 3.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 750.0) do
    star & byClass "musicPanel" ? do
      width $ pct $ 100.0 / 2.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 500.0) do
    star & byClass "musicPanel" ? do
      width $ pct $ 100.0
  star & byClass "musicPlayer" ? do
    position fixed
    bottom $ px 0.0
    left $ px 0.0
    width $ pct 100.0
    height $ px 120.0
    border solid (px 0.0) black
  star & byClass "bodyRoot" ? do
    marginBottom $ px 120.0
  star & byClass "navigationBar" ? do
    display flex
    marginLeft auto
    marginRight auto
    marginTop $ px 10.0
    marginBottom $ px 10.0
    fontFaceFamily "sans-serif"
    fontWeight bold
    justifyContent Common.center
    a ? do
      marginLeft $ px 20.0
      marginRight $ px 20.0
      fontSize $ pct 150.0
    fromString "a:link" ? do
      color black
    fromString "a:visited" ? do
      color black
    fromString "a:hover" ? do
      color $ rgb 168 35 62
    fromString "a:active" ? do
      color $ rgb 168 35 62
    a & byClass "nowPage" ? do
      color $ rgb 168 35 62
  main ? do
    flexGrow $ 1.0
    flexShrink $ 1.0
    flexBasis $ px 0.0
  footer ? do
    width $ pct 100.0
    marginTop auto

component :: forall query input output m. H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ HC.stylesheet style