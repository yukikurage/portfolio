module YukiPortfolio.Components.PicturePanel where

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
import YukiPortfolio.Data.Picture (Picture(..))

image_ = Proxy :: Proxy "image"

type Input =
  { picture :: Picture
  }

data Output = View

component :: forall q m. H.Component q Input Output m
component = Hooks.component \tokens input -> Hooks.do
  isLoad /\ isLoadId <- Hooks.useState false

  let Picture pictureRecord = input.picture

  Hooks.pure $ HH.div [HP.class_ $ H.ClassName "hover:opacity-70 bg-yukiYellow duration-100 h-56 w-auto", HE.onClick (\_ -> Hooks.raise tokens.outputToken $ View)]
    [ HH.img
      [ onLoad \_ -> Hooks.put isLoadId true
      , onClick (\_ -> Hooks.raise tokens.outputToken $ View)
      , width pictureRecord.width, height pictureRecord.height
      , src pictureRecord.src
      , css $ "cursor-pointer h-full w-auto max-h-full duration-100 "
        <> if isLoad then "opacity-100" else "opacity-0"
      ]
    ]