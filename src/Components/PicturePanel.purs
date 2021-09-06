module YukiPortfolio.Components.PicturePanel where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.ImageLoader as ImageLoader
import YukiPortfolio.Data.Picture (Picture(..))

image_ = Proxy :: Proxy "image"

type Input =
  { picture :: Picture
  }

data Output = ClickPic

component :: forall q m. H.Component q Input Output m
component = Hooks.component \tokens input -> Hooks.do
  let Picture pictureRecord = input.picture

  Hooks.pure $ HH.div [css "picturePanel"]
    [ HH.div
      [ css "picturePanelInner"
      , HE.onClick (\_ -> Hooks.raise tokens.outputToken $ ClickPic)]
      [ HH.div [HP.class_ $ H.ClassName "imgWrapper"]
        [ HH.slot_ image_ unit ImageLoader.component
          { width: pictureRecord.width
          , height: pictureRecord.height
          , src: pictureRecord.src} ]
      ]
    ]