module YukiPortfolio.Components.HTML.MusicPlayer where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Data.Music (Music(..))
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))

allow :: forall r i. String -> HH.IProp (| r) i
allow = HH.prop (HH.PropName "allow")

musicPlayer :: forall w i. MusicPlayerState -> HH.HTML w i
musicPlayer musicPlayerState = case musicPlayerState of
  Playing (Music music) -> case music.soundTrackId of
    Just id -> HH.div [HP.class_ $ HH.ClassName "musicPlayer"]
      [ HH.iframe
        [ HP.class_ $ HH.ClassName "musicPlayer", allow "autoplay", HP.src $
          "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"<> show id <> "&color=%23a8233e&auto_play=true&hide_related=false&show_comments=false&show_user=false&show_playcount=false&show_reposts=false&show_teaser=false&show_artwork=true"
        ]
      ]
    Nothing -> HH.div_ []
  NotPlaying -> HH.div_ []
