module YukiPortfolio.Components.Root where

import Prelude
import Halogen as H
import Halogen.HTML as HH

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
render state = HH.div_ []

handleAction :: forall output m. Action -> H.HalogenM State Action () output m Unit
handleAction action = pure unit
