module YukiPortfolio.Styles.TitleBar where

import Prelude hiding (top, bottom)

import CSS (CSS, Display(..), absolute, alignItems, backgroundColor, backgroundImage, backgroundPosition, black, borderBox, bottom, boxSizing, byClass, color, cursor, display, flex, flexGrow, flexStart, fontFamily, fontSize, fromString, height, justifyContent, left, maxHeight, noneTextDecoration, opacity, paddingLeft, paddingRight, pct, placed, position, prefixed, px, relative, right, sansSerif, sideCenter, star, textDecoration, textWhitespace, top, transform, transitionDuration, url, value, white, whitespaceNoWrap, width, (&), (?))
import CSS.Common (auto, center)
import CSS.Cursor as Cursor
import CSS.TextAlign as TextAlign
import CSS.Transform (scale)
import Data.NonEmpty (singleton)

style :: CSS
style = do
  star & byClass "titleBar" ? do
    width $ pct 100.0
    height $ px 60.0
    paddingLeft $ px 20.0
    paddingRight $ px 20.0
    backgroundPosition $ placed sideCenter sideCenter
    backgroundImage $ url "./images/nou2_nologo.png"
    prefixed (fromString "background-size") "calc(max(100%, 1000px))"
    position relative
    boxSizing borderBox
  star & byClass "titleBar::before" ? do
    backgroundColor black
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
      alignItems center
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
        fontFamily ["Big Shoulders Display"] $ singleton sansSerif
        color white
        fontSize $ pct 250.0
        textWhitespace whitespaceNoWrap
        flexGrow $ 1.0
      star & byClass "socialIconLink" ? do
        display $ Display $ value "contents"
        textDecoration $ noneTextDecoration
      star & byClass "socialIcon" ? do
        width $ px 70.0
        color white
        fontSize $ pct 180.0
        TextAlign.textAlign $ TextAlign.center
        cursor Cursor.pointer
        transitionDuration "0.1s"
        display flex
        alignItems center
        justifyContent center
        height $ pct 100.0
      fromString ".socialIcon:hover" ? do
        transform $ scale 1.1 1.1