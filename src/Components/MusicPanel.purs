module YukiPortfolio.Components.MusicPanel where

import Prelude

import Data.Tuple.Nested ((/\))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events (onClick, onLoad)
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties (height, src, width)
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.ImageLoader as ImageLoader
import YukiPortfolio.Data.Music (Music(..))

image_ = Proxy :: Proxy "image"

type Input =
  { music :: Music
  }

data Output = Play

component :: forall q m. H.Component q Input Output m
component = Hooks.component \tokens input -> Hooks.do
  isLoad /\ isLoadId <- Hooks.useState false

  let Music musicRecord = input.music

  Hooks.pure $ HH.div [css "w-full text-center"]
    [ HH.img
      [ onLoad \_ -> Hooks.put isLoadId true
      , onClick (\_ -> Hooks.raise tokens.outputToken $ Play)
      , width 100, height 100
      , src musicRecord.thumbnail
      , css $ "hover:opacity-70 bg-yukiYellow cursor-pointer h-auto w-full max-h-full duration-100 "
        <> if isLoad then "opacity-100" else "opacity-0"
      ]
    , HH.p [css "block my-1.5 font-bold"] [HH.text musicRecord.title]
    , HH.p_ [HH.text musicRecord.description]
    ]