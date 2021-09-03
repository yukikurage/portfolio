module YukiPortfolio.Components.StyleSheet where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.CSS as HC
import Halogen.HTML.Properties as HP
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import CSS (CSS, byClass, display, flex, height, img, justifyContent, maxHeight, maxWidth, p, pct, spaceBetween, star, width, (&), (?), (|>))
import CSS.Common (auto)

data Action

type State
  = Unit

component :: forall query input output m. MusicHandler m => H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

initialState :: forall input. input -> State
initialState _ = unit

render :: forall m. MusicHandler m => State -> H.ComponentHTML Action () m
render _ = HC.stylesheet style

handleAction :: forall output m. Action -> H.HalogenM State Action () output m Unit
handleAction _ = pure unit

style :: CSS
style = do
  star & byClass "musicPanel"
    ? do
        display flex
        justifyContent spaceBetween
  (star & byClass "musicPanel") |> p
    ? do
        width $ pct 30.0
  ((star & byClass "musicPanel") |> p) |> img
    ? do
        width auto
        height auto
        maxWidth $ pct 100.0
        maxHeight $ pct 100.0
