module YukiPortfolio.Styles.StyleSheet where

import Prelude hiding (top, bottom)

import CSS (CSS, absolute, backgroundColor, bottom, byClass, color, column, display, fixed, flex, flexFlow, flexGrow, fontFamily, fromString, height, justifyContent, left, minHeight, nowrap, paddingBottom, paddingLeft, paddingRight, paddingTop, pct, position, prefixed, px, right, sansSerif, spaceBetween, star, top, vh, width, zIndex, (&), (?), (|>))
import Data.NonEmpty as NonEmpty
import YukiPortfolio.Styles.AboutPage as AboutPage
import YukiPortfolio.Styles.Common (yukiColors)
import YukiPortfolio.Styles.ErrorMessage as ErrorMessage
import YukiPortfolio.Styles.MusicPlayer as MusicPlayer
import YukiPortfolio.Styles.MusicsPage as MusicsPage
import YukiPortfolio.Styles.NavigationBar as NavigationBar
import YukiPortfolio.Styles.PictureViewer as PictureViewer
import YukiPortfolio.Styles.PicturesPage as PicturesPage
import YukiPortfolio.Styles.TitleBar as TitleBar

style :: CSS
style = do
  ErrorMessage.style

  star & byClass "bodyRoot" ? do
    fontFamily ["Meiryo","メイリオ","Verdana"] $ NonEmpty.singleton sansSerif
    color $ yukiColors.black

  (star & byClass "static") |> star ? do
    prefixed (fromString "pointer-events") "auto"

  star & byClass "static" ? do
    position fixed
    left $ px 0.0
    top $ px 0.0
    width $ pct 100.0
    height $ pct 100.0
    zIndex 100
    display flex
    flexFlow column nowrap
    justifyContent spaceBetween
    prefixed (fromString "pointer-events") "none"

    star & byClass "header" ? do
      left $ px 0.0
      top $ px 0.0
      width $ pct 100.0

      TitleBar.style
      NavigationBar.style

    PictureViewer.style
    MusicPlayer.style

  star & byClass "dynamic" ? do
    zIndex 50
    position absolute
    top $ px 0.0
    left $ px 0.0
    right $ px 0.0
    bottom $ px 0.0
    display flex
    flexFlow column nowrap
    minHeight $ vh 100.0

    star & byClass "main" ? do
      flexGrow 1.0
      paddingTop $ px 130.0
      paddingBottom $ px 130.0
      paddingLeft $ px 15.0
      paddingRight $ px 15.0

      AboutPage.style
      MusicsPage.style
      PicturesPage.style

    star & byClass "footer" ? do
      backgroundColor $ yukiColors.greyYellow
      color yukiColors.black
      paddingBottom $ px 120.0
      paddingLeft $ px 20.0