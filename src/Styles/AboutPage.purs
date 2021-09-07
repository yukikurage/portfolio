module YukiPortfolio.Styles.AboutPage where

import Prelude

import CSS (CSS, block, borderRadius, byClass, color, display, flex, flexWrap, height, justifyContent, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, p, paddingTop, pct, position, px, relative, spaceAround, star, width, wrap, (&), (?))
import CSS.Common (auto)
import CSS.TextAlign as TextAlign
import YukiPortfolio.Styles.Common (fadeIn, yukiColors)

style :: CSS
style = do
  star & byClass "about" ? do
    position relative
    fadeIn "about" $ px $ - 6.0
    color yukiColors.black
    marginTop $ px 10.0
    TextAlign.textAlign TextAlign.center
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
      TextAlign.textAlign $ TextAlign.center
      p ? do
        TextAlign.textAlign TextAlign.startTextAlign
