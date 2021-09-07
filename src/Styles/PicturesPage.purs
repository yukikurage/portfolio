module YukiPortfolio.Styles.PicturesPage where

import Prelude

import CSS (CSS, backgroundColor, backgroundPosition, backgroundRepeat, byClass, cursor, display, flex, flexWrap, height, img, justifyContent, margin, marginLeft, marginRight, maxWidth, minWidth, noRepeat, opacity, paddingTop, pct, placed, px, sideCenter, star, transitionDuration, width, wrap, (&), (?))
import CSS.Common (auto, center)
import CSS.Cursor as Cursor
import CSS.TextAlign as TextAlign
import CSS.VerticalAlign as VerticalAlign
import YukiPortfolio.Styles.Common (fadeIn, yukiColors)

style :: CSS
style = do
  star & byClass "pictures" ? do

    star & byClass "picturePanel" ? do
      margin (px 10.0) (px 10.0) (px 10.0) (px 10.0)
      height $ px $ 240.0
      TextAlign.textAlign TextAlign.center
      star & byClass "imgWrapper" ? do
        cursor Cursor.pointer
        height $ pct 100.0
        width auto
        -- background $ url "./public/images/loading_black.gif"
        backgroundRepeat $ noRepeat
        backgroundColor $ yukiColors.greyYellow
        backgroundPosition $ placed sideCenter sideCenter
        transitionDuration "0.1s"
      star & byClass "imgWrapper:hover" ? do
        opacity 0.7
      img ? do
        height $ pct 100.0
        width auto
        transitionDuration "0.3s"
        VerticalAlign.verticalAlign VerticalAlign.Top
      img & byClass "loading" ? do
        opacity 0.0
      img & byClass "loaded" ? do
        opacity 1.0

    fadeIn "pictures"
    maxWidth $ px 1000.0
    minWidth $ px 250.0
    marginLeft auto
    marginRight auto
    paddingTop $ px 20.0
    display flex
    flexWrap wrap
    justifyContent center