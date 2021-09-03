module YukiPortfolio.Parts.MusicPanel where

import Prelude

import Effect.Class (class MonadEffect)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import YukiPortfolio.Types.Contents.Music (Music(..))
import YukiPortfolio.Types.MusicPlayerState (MusicPlayerState(..))

musicPanel :: forall w m. MonadEffect m => Music -> Hooks.StateId MusicPlayerState -> HH.HTML w (Hooks.HookM m Unit)
musicPanel (Music music) nowPlayingId =
  HH.div [HP.class_ $ HH.ClassName "musicPanel"]
  [ HH.div
    [ HP.class_ $ HH.ClassName "musicPanelInner"
    , HE.onClick (\_ -> Hooks.put nowPlayingId (Playing $ Music music))]
    [ HH.img [HP.src music.thumbnail]
    , HH.h4_ [HH.text music.title]
    , HH.p_ [HH.text music.description]
    ]
  ]