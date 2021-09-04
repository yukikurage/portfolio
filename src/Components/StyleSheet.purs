module YukiPortfolio.Components.StyleSheet where

import Prelude

import CSS (CSS, Color, a, absolute, alignItems, background, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, backgroundSize, black, border, bottom, byClass, color, cover, cursor, display, fixed, flex, flexBasis, flexGrow, flexShrink, flexStart, flexWrap, fontFamily, fontSize, footer, fromString, height, img, inlineBlock, justifyContent, left, linear, main, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minWidth, noRepeat, noneTextDecoration, offsetCenter, offsetTop, opacity, paddingBottom, paddingLeft, paddingRight, paddingTop, pct, placed, position, prefixed, px, query, relative, rgb, rgba, right, sansSerif, sec, sideCenter, solid, spaceBetween, star, textDecoration, textWhitespace, top, transform, transformOrigin, transition, transitionDelay, transitionDuration, url, white, whitespaceNoWrap, width, wrap, (&), (?))
import CSS.Common (auto)
import CSS.Common as Common
import CSS.Cursor (pointer)
import CSS.Media (screen)
import CSS.Media as CMedia
import CSS.TextAlign (center, textAlign)
import CSS.Transform (scale)
import Data.NonEmpty as NonEmpty
import Halogen as H
import Halogen.HTML.CSS as HC
import Halogen.Hooks as Hooks

yukiRed :: Color
yukiRed = rgb 168 35 62

yukiGreyYellow :: Color
yukiGreyYellow = rgb 245 241 231

yukiBlack :: Color
yukiBlack = rgb 20 20 20

style :: CSS
style = do
  star & byClass "musics" ? do
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
      backgroundColor yukiGreyYellow
      backgroundPosition $ placed sideCenter sideCenter
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
    border solid (px 0.0) yukiBlack
  star & byClass "bodyRoot" ? do
    marginTop $ px 160.0
    marginBottom $ px 120.0
  star & byClass "navigationBar" ? do
    backgroundColor yukiGreyYellow
    opacity 0.8
    display flex
    marginLeft auto
    marginRight auto
    marginTop $ px 0.0
    paddingTop $ px 16.0
    paddingBottom $ px 16.0
    fontFamily ["Montserrat"] $ NonEmpty.singleton sansSerif
    justifyContent $ flexStart
    a ? do
      marginLeft $ px 20.0
      marginRight $ px 20.0
      fontSize $ pct 150.0
      textDecoration $ noneTextDecoration
      position relative
      display inlineBlock
    fromString "a::after" ? do
      position absolute
      bottom $ px $ 2.0
      left $ px 0.0
      prefixed (fromString "content") "''"
      width $ pct 100.0
      height $ px 2.0
      background yukiRed
      opacity 0.0
      prefixed (fromString "visibility") "hidden"
      -- transition "transform" (sec 0.08) linear (sec 0.0)
      transitionDuration "0.08s"
    fromString "a:link" ? do
      color yukiBlack
    fromString "a:visited" ? do
      color yukiBlack
    fromString "a:hover" ? do
      color yukiBlack
    fromString "a:hover::after" ? do
      opacity 1.0
      bottom $ px $ - 4.0
      prefixed (fromString "visibility") "visible"
    fromString "a:active" ? do
      color yukiBlack
    a & byClass "nowPage" ? do
      color yukiRed
  star & byClass "titleBar" ? do
    marginBottom $ px 0.0
    width $ pct 100.0
    height $ px 100.0
    backgroundPosition $ placed sideCenter sideCenter
    backgroundImage $ url "./public/images/nou2_nologo.png"
    prefixed (fromString "background-size") "calc(max(100%, 1000px))"
    position relative
  star & byClass "titleBar::before" ? do
    backgroundColor yukiBlack
    opacity 0.8
    position absolute
    top $ px 0.0
    left $ px 0.0
    right $ px 0.0
    bottom $ px 0.0
    prefixed (fromString "content") "''"
  star & byClass "titleBar" ? do
    star & byClass "content" ? do
      display flex
      alignItems Common.center
      justifyContent flexStart
      position absolute
      width $ pct 100.0
      height $ pct 100.0
      star & byClass "icon" ? do
        maxHeight $ pct 70.0
        width auto
      star & byClass "yukikurage" ? do
        maxHeight $ pct 60.0
        width auto
        -- font-family: 'Montserrat', sans-serif;
        fontFamily ["Big Shoulders Display"] $ NonEmpty.singleton sansSerif
        color white
        fontSize $ pct 250.0
        textWhitespace whitespaceNoWrap
  star & byClass "header" ? do
    position fixed
    left $ px 0.0
    top $ px 0.0
    width $ pct 100.0
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