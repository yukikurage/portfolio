module YukiPortfolio.Components.MusicPanel where

import Prelude

import Data.Tuple.Nested ((/\))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Music (Music(..))

type Input =
  { music :: Music
  }

data Output = Play

component :: forall q m. H.Component q Input Output m
component = Hooks.component \tokens input -> Hooks.do
  isLoad /\ isLoadId <- Hooks.useState false

  let Music musicRecord = input.music

  Hooks.pure $ HH.div [css "musicPanel"]
    [ HH.div
      [ css "musicPanelInner"
      , HE.onClick (\_ -> Hooks.raise tokens.outputToken $ Play)]
      [ HH.div [HP.class_ $ H.ClassName "imgWrapper"]
        [ HH.img
          [ HP.src musicRecord.thumbnail
          , HP.width 200
          , HP.height 200
          , HE.onLoad \_ -> Hooks.put isLoadId true
          , HP.style $ if isLoad then "opacity:1" else "opacity:0"
          ]
        ]
      , HH.h4_ [HH.text musicRecord.title]
      , HH.p_ [HH.text musicRecord.description]
      ]
    ]