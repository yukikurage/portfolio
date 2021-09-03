module YukiPortfolio.Components.Root where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.CSS as HC
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Pages.Musics as Musics
import YukiPortfolio.Style (style)

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
render state = HH.div [ HC.style style ] [ HH.slot_ Musics._proxy unit Musics.component unit ]

handleAction :: forall output m. Action -> H.HalogenM State Action Slots output m Unit
handleAction action = pure unit
