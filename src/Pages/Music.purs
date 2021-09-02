module YukiPortfolio.Pages.Music where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Parts.MusicPanel as MusicPanel
import YukiPortfolio.Types.Contents.Music (Music(..))
import Halogen.Hooks as Hooks

part = Hooks.do
  musics <- H.lift getMusics
  HH.div
    [ HP.class_ $ H.ClassName "flex"
    ]
    [ HH.p_ []
    , HH.p_ []
    ]
