module YukiPortfolio.Components.StyleSheet where

import Prelude

import CSS (Abs, AnimationName(..), CSS, Color, Display(..), GenericFontFamily(..), Size, a, absolute, alignItems, animation, background, backgroundColor, backgroundImage, backgroundPosition, backgroundRepeat, block, border, borderBox, borderRadius, bottom, boxSizing, byClass, color, column, cursor, display, ease, fixed, flex, flexFlow, flexGrow, flexStart, flexWrap, fontFamily, fontSize, forwards, fromString, height, img, inlineBlock, iterationCount, justifyContent, keyframesFromTo, left, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minHeight, minWidth, noRepeat, noneTextDecoration, normalAnimationDirection, nowrap, opacity, p, paddingBottom, paddingLeft, paddingRight, paddingTop, pct, placed, position, prefixed, px, query, relative, rgb, rgba, right, sansSerif, sec, sideCenter, solid, spaceAround, spaceBetween, star, textDecoration, textWhitespace, top, transform, transitionDuration, url, value, vh, white, whitespaceNoWrap, width, wrap, zIndex, (&), (?))
import CSS.Common (auto)
import CSS.Common as Common
import CSS.Cursor (pointer)
import CSS.Media (screen)
import CSS.Media as CMedia
import CSS.Overflow (hidden, overflow)
import CSS.TextAlign (center, leftTextAlign, startTextAlign, textAlign)
import CSS.Transform (scale)
import Data.NonEmpty as NonEmpty
import Halogen as H
import Halogen.HTML.CSS as HC
import Halogen.Hooks as Hooks

yukiRed :: Color
yukiRed = rgb 168 35 62

yukiGreyYellow :: Number -> Color
yukiGreyYellow op = rgba 245 241 231 op

yukiBlack :: Color
yukiBlack = rgb 50 50 50

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

errorMessageStyle :: CSS
errorMessageStyle = do
  star & byClass "errorMessage" ? do
    textAlign center

asciiArtStyle :: CSS
asciiArtStyle = do
  star & byClass "asciiBlock" ? do
    width auto
    height auto
    marginLeft auto
    marginRight auto
    star & byClass "ascii" ? do
      textAlign leftTextAlign
      fontFamily ["ＭＳ Ｐゴシック","ＭＳＰゴシック","MSPゴシック","MS Pゴシック"] $ NonEmpty.singleton
        $ GenericFontFamily $ value "monospace"

aboutPageStyle :: CSS
aboutPageStyle = do
  star & byClass "about" ? do
    fadeIn "about"
    color yukiBlack
    marginTop $ px 10.0
    textAlign center
    star & byClass "yukiIcon" ? do
      borderRadius (pct 50.0) (pct 50.0) (pct 50.0) (pct 50.0)
      marginLeft auto
      marginRight auto
      display block
    star & byClass "mainContents" ? do
      maxWidth $ px 800.0
      minWidth $ px 400.0
      marginLeft auto
      marginRight auto
      paddingTop $ px 10.0
      display flex
      flexWrap wrap
      justifyContent spaceAround
    star & byClass "aboutPanel" ? do
      marginTop $ px 5.0
      marginBottom $ px 5.0
      width $ px $ 350.0
      height auto
      textAlign $ center
      p ? do
        textAlign startTextAlign

musicPageStyle :: CSS
musicPageStyle = do
  star & byClass "musics" ? do
    fadeIn "musics"
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
      backgroundColor $ yukiGreyYellow 1.0
      backgroundPosition $ placed sideCenter sideCenter
      fadeIn "musicPanel"
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

style :: CSS
style = do
  errorMessageStyle
  aboutPageStyle
  musicPageStyle
  star & byClass "musicPlayer" ? do
    position fixed
    bottom $ px 0.0
    left $ px 0.0
    width $ pct 100.0
    height $ px 120.0
    border solid (px 0.0) yukiBlack
    zIndex 90

  star & byClass "navigationBar" ? do
    backgroundColor $ yukiGreyYellow 0.8
    display flex
    paddingTop $ px 10.0
    paddingBottom $ px 10.0
    paddingLeft $ px 20.0
    fontFamily ["Montserrat"] $ NonEmpty.singleton sansSerif
    justifyContent $ flexStart
    a ? do
      marginRight $ px 24.0
      fontSize $ pct 140.0
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
    width $ pct 100.0
    height $ px 60.0
    paddingLeft $ px 20.0
    paddingRight $ px 20.0
    backgroundPosition $ placed sideCenter sideCenter
    backgroundImage $ url "./public/images/nou2_nologo.png"
    prefixed (fromString "background-size") "calc(max(100%, 1000px))"
    position relative
    boxSizing borderBox

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
      position relative
      width $ pct 100.0
      height $ pct 100.0
      star & byClass "icon" ? do
        maxHeight $ pct 70.0
        width auto
      star & byClass "yukikurage" ? do
        maxHeight $ pct 100.0
        width auto
        -- font-family: 'Montserrat', sans-serif;
        fontFamily ["Big Shoulders Display"] $ NonEmpty.singleton sansSerif
        color white
        fontSize $ pct 250.0
        textWhitespace whitespaceNoWrap
        flexGrow $ 1.0
      star & byClass "socialIconLink" ? do
        display $ Display $ value "contents"
        textDecoration $ noneTextDecoration
      star & byClass "socialIcon" ? do
        width $ px 80.0
        color white
        fontSize $ pct 180.0
        textAlign $ center
        cursor pointer
        transitionDuration "0.1s"
      fromString ".socialIcon:hover" ? do
        transform $ scale 1.1 1.1

  star & byClass "bodyRoot" ? do
    fontFamily ["Meiryo","メイリオ","Verdana"] $ NonEmpty.singleton sansSerif
    color $ yukiBlack

  star & byClass "header" ? do
    zIndex 100
    position fixed
    left $ px 0.0
    top $ px 0.0
    width $ pct 100.0

  star & byClass "dynamic" ? do
    position absolute
    top $ px 0.0
    left $ px 0.0
    right $ px 0.0
    bottom $ px 0.0
    display flex
    flexFlow column nowrap
    minHeight $ vh 100.0

  star & byClass "main" ? do
    paddingTop $ px 130.0
    flexGrow 1.0
    paddingBottom $ px 130.0
    paddingLeft $ px 15.0
    paddingRight $ px 15.0

  star & byClass "footer" ? do
    zIndex 80
    backgroundColor $ yukiGreyYellow 1.0
    color yukiBlack
    paddingBottom $ px 120.0
    paddingLeft $ px 20.0

component :: forall query input output m. H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ HC.stylesheet style