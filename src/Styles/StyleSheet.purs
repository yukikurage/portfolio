module YukiPortfolio.Styles.StyleSheet where

import Prelude hiding (top, bottom)

import CSS (CSS, absolute, backgroundColor, bottom, byClass, color, column, display, fixed, flex, flexFlow, flexGrow, fontFamily, left, minHeight, nowrap, paddingBottom, paddingLeft, paddingRight, paddingTop, pct, position, px, right, sansSerif, star, top, vh, width, zIndex, (&), (?))
import Data.NonEmpty as NonEmpty
import Halogen as H
import Halogen.HTML.CSS as HC
import Halogen.Hooks as Hooks
import YukiPortfolio.Styles.AboutPage as AboutPage
import YukiPortfolio.Styles.Common (yukiColors)
import YukiPortfolio.Styles.ErrorMessage as ErrorMessage
import YukiPortfolio.Styles.MusicPlayer as MusicPlayer
import YukiPortfolio.Styles.MusicsPage as MusicsPage
import YukiPortfolio.Styles.NavigationBar as NavigationBar
import YukiPortfolio.Styles.TitleBar as TitleBar

component :: forall query input output m. H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ HC.stylesheet style

style :: CSS
style = do
  ErrorMessage.style
  AboutPage.style
  MusicsPage.style
  TitleBar.style
  MusicPlayer.style
  NavigationBar.style

  star & byClass "bodyRoot" ? do
    fontFamily ["Meiryo","メイリオ","Verdana"] $ NonEmpty.singleton sansSerif
    color $ yukiColors.black

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
    backgroundColor $ yukiColors.greyYellow
    color yukiColors.black
    paddingBottom $ px 120.0
    paddingLeft $ px 20.0