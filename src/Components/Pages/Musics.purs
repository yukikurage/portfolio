module YukiPortfolio.Components.Pages.Musics where


import Prelude

import Data.Array (mapWithIndex, replicate)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
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

  Hooks.pure $ HH.div [ HP.class_ $ H.ClassName "musics"] $ mapWithIndex
    (\i music -> HH.slot _musicPanel i MusicPanel.component {music: music} $ case _ of
      MusicPanel.Play -> Hooks.raise tokens.outputToken $ Play music
    ) musics <> dummies
  where
    dummies = replicate 4 $ HH.div [ HP.class_ $ H.ClassName "musicPanel" ] [HH.text ""]
