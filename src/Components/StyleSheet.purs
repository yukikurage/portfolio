module YukiPortfolio.Components.StyleSheet where

import Prelude

import CSS (CSS, backgroundColor, black, border, borderTop, byClass, display, flex, flexWrap, height, img, justifyContent, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minWidth, pct, px, query, solid, spaceBetween, star, whitesmoke, width, wrap, (&), (?))
import CSS.Common (auto)
import CSS.Media (screen)
import CSS.Media as CMedia
import Color.Scheme.MaterialDesign (grey)
import Data.NonEmpty as NonEmpty
import Halogen as H
import Halogen.HTML.CSS as HC

style :: CSS
style = do
  star & byClass "musicPanels" ? do
    backgroundColor $ whitesmoke
    maxWidth $ px 1000.0
    minWidth $ px 250.0
    marginLeft auto
    marginRight auto
    display flex
    flexWrap wrap
    justifyContent spaceBetween
  star & byClass "musicPanel" ? do
    width $ pct 24.5
    marginTop $ px 8.0
    marginBottom $ px 8.0
    img ? do
      width auto
      height auto
      maxWidth $ pct 100.0
      maxHeight $ pct 100.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 800.0) do
    star & byClass "musicPanel" ? do
      width $ pct 33.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 600.0) do
    star & byClass "musicPanel" ? do
      width $ pct 49.0
  query screen (NonEmpty.singleton $ CMedia.maxWidth $ px 400.0) do
    star & byClass "musicPanel" ? do
      width $ pct 100.0
  star & byClass "musicPlayer" ? do
    width $ pct 100.0
    height $ px 80.0
    border solid (px 0.0) black
    borderTop solid (px 1.0) grey

data Action

type State
  = Unit

component :: forall query input output m. H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

initialState :: forall input. input -> State
initialState _ = unit

render :: forall m. State -> H.ComponentHTML Action () m
render _ = HC.stylesheet style

handleAction :: forall output m. Action -> H.HalogenM State Action () output m Unit
handleAction _ = pure unit
