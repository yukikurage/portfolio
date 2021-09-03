module YukiPortfolio.Components.Body where

import Prelude

import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Pages.Musics (useMusicsPage)
import YukiPortfolio.Parts.MusicPlayer (musicPlayer)
import YukiPortfolio.Types.MusicPlayerState (MusicPlayerState(..))

component :: forall query input output m. MusicHandler m => MonadEffect m => H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  nowPlaying /\ nowPlayingId <- Hooks.useState NotPlaying
  musicsPage <- useMusicsPage nowPlayingId
  Hooks.pure $ HH.div [HP.class_ $ H.ClassName "bodyRoot"]
    [ HH.main_
      [ musicsPage
      ]
    , musicPlayer nowPlaying
    ]