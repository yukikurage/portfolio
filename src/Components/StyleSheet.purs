module YukiPortfolio.Components.StyleSheet where

import Prelude

import CSS (CSS, absolute, backgroundColor, black, border, borderTop, bottom, byClass, column, cursor, display, fixed, flex, flexBasis, flexFlow, flexGrow, flexShrink, flexWrap, footer, height, img, justifyContent, left, main, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minHeight, minWidth, nowrap, paddingLeft, paddingRight, paddingTop, pct, position, px, query, solid, spaceBetween, star, vh, whitesmoke, width, wrap, (&), (?))
import CSS.Common (auto)
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
      width auto
      height auto
      maxWidth $ pct 100.0
      maxHeight $ pct 100.0
      cursor pointer
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
    borderTop solid (px 1.0) grey
  star & byClass "bodyRoot" ? do
    marginBottom $ px 120.0
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