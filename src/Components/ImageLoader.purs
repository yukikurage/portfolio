module YukiPortfolio.Components.ImageLoader where

import Prelude hiding (div)

import Data.Tuple.Nested ((/\))
import Halogen (Component)
import Halogen.HTML (img)
import Halogen.HTML.Events (onLoad)
import Halogen.HTML.Properties (height, src, width)
import Halogen.Hooks as Hooks
import YukiPortfolio.Components.Common (css)

type Input =
  { height :: Int
  , src :: String
  , width :: Int
  }

component :: forall q o m. Component q Input o m
component = Hooks.component \_ input -> Hooks.do
  isLoad /\ isLoadId <- Hooks.useState false

  Hooks.pure $ img
    [ src input.src
    , width input.width
    , height input.height
    , onLoad \_ -> Hooks.put isLoadId true
    , css if isLoad then "loaded" else "loading"
    ]