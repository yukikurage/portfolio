module YukiPortfolio.Components.Body where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Pages.Musics as Musics

data Action

type State
  = Unit

type Slots
  = ( musics :: Musics.Slot Unit )

component :: forall query input output m. MusicHandler m => H.Component query input output m
component =
  H.mkComponent
    { initialState
    , render
    , eval: H.mkEval $ H.defaultEval { handleAction = handleAction }
    }

initialState :: forall input. input -> State
initialState _ = unit

render :: forall m. MusicHandler m => State -> H.ComponentHTML Action Slots m
render _ =
  HH.div_
    [ HH.slot_ Musics._proxy unit Musics.component unit ]

handleAction :: forall output m. Action -> H.HalogenM State Action Slots output m Unit
handleAction _ = pure unit
