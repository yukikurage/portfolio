module YukiPortfolio.Styles.MusicsPage where

import Prelude

import CSS (CSS, background, backgroundColor, backgroundPosition, backgroundRepeat, byClass, cursor, display, flex, flexWrap, height, img, justifyContent, marginLeft, marginRight, maxHeight, maxWidth, minWidth, noRepeat, paddingLeft, paddingRight, paddingTop, pct, placed, px, query, sideCenter, spaceBetween, star, transitionDuration, url, width, wrap, (&), (?))
import CSS.Common (auto)
import CSS.Cursor as Cursor
import CSS.Media as Media
import CSS.TextAlign as TextAlign
import Data.NonEmpty (singleton)
import YukiPortfolio.Styles.Common (fadeIn, yukiColors)

style :: CSS
style = do
  star & byClass "musics" ? do
    star & byClass "musicPanelInner" ? do
      paddingLeft $ px 6.0
      paddingRight $ px 6.0

    star & byClass "musicPanel" ? do
      width $ pct $ 100.0 / 4.0
      TextAlign.textAlign TextAlign.center
      star & byClass "imgWrapper" ? do
        height auto
        width auto
        background $ url "./public/images/loading_black.gif"
        backgroundRepeat $ noRepeat
        backgroundColor $ yukiColors.greyYellow
        backgroundPosition $ placed sideCenter sideCenter
      img ? do
        height auto
        width $ pct 100.0
        maxHeight $ pct 100.0
        cursor Cursor.pointer
        transitionDuration "0.3s"
    query Media.screen (singleton $ Media.maxWidth $ px 1000.0) do
      star & byClass "musicPanel" ? do
        width $ pct $ 100.0 / 3.0
    query Media.screen (singleton $ Media.maxWidth $ px 750.0) do
      star & byClass "musicPanel" ? do
        width $ pct $ 100.0 / 2.0
    query Media.screen (singleton $ Media.maxWidth $ px 500.0) do
      star & byClass "musicPanel" ? do
        width $ pct $ 100.0

    fadeIn "musics"
    maxWidth $ px 1000.0
    minWidth $ px 250.0
    marginLeft auto
    marginRight auto
    paddingTop $ px 20.0
    display flex
    flexWrap wrap
    justifyContent spaceBetween