module YukiPortfolio.Components.Pages.Pictures where

import Prelude

import Data.Array (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.PicturesHandler (class PicturesHandler, getPictures)
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.PicturePanel as PicturePanel
import YukiPortfolio.Data.Picture (Picture)

_picturePanel = Proxy :: Proxy "picturePanel"

data Output = View Picture

component :: forall q i m.
  Monad m =>
  PicturesHandler m =>
  H.Component q i Output m
component = Hooks.component \tokens _ -> Hooks.do
  pictures /\ picturesId <- Hooks.useState $ []

  Hooks.useLifecycleEffect do
    Hooks.put picturesId =<< lift getPictures
    pure Nothing

  Hooks.pure $ HH.div [css "animate-fade-in-quick max-w-6xl min-w-min mx-auto flex flex-wrap justify-center relative"] $ mapWithIndex
    (\i picture -> HH.slot _picturePanel i PicturePanel.component {picture: picture} $ case _ of
      PicturePanel.View -> Hooks.raise tokens.outputToken $ View picture
    ) pictures