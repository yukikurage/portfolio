module YukiPortfolio.Components.MusicPanel where

import Prelude

import Data.Tuple.Nested ((/\))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Music (Music(..))
import YukiPortfolio.Components.ImageLoader as ImageLoader

image_ = Proxy :: Proxy "image"

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
        [ HH.slot_ image_ unit ImageLoader.component {width: 200, height: 200, src: musicRecord.thumbnail} ]
      , HH.h4_ [HH.text musicRecord.title]
      , HH.p_ [HH.text musicRecord.description]
      ]
    ]