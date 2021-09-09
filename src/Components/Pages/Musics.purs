module YukiPortfolio.Components.Pages.Musics where

import Prelude

import CSS (relative)
import Data.Array (mapWithIndex, replicate)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.MusicPanel as MusicPanel
import YukiPortfolio.Data.Music (Music)

_musicPanel = Proxy :: Proxy "musicPanel"

data Output = Play Music

component :: forall q i m.
  Monad m =>
  MusicHandler m =>
  H.Component q i Output m
component = Hooks.component \tokens _ -> Hooks.do
  musics /\ musicsId <- Hooks.useState $ []

  Hooks.useLifecycleEffect do
    Hooks.put musicsId =<< lift getMusics
    pure Nothing

  Hooks.pure $ HH.div [css "relative animate-fade-in-quick max-w-5xl min-w-min mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3"] $ mapWithIndex
    (\i music -> HH.slot _musicPanel i MusicPanel.component {music: music} $ case _ of
      MusicPanel.Play -> Hooks.raise tokens.outputToken $ Play music
    ) musics