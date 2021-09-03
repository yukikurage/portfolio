module YukiPortfolio.Parts.MusicPlayer where

import Prelude

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Types.Contents.Music (Music(..))

musicPlayer :: forall w i. Music -> HH.HTML w i
musicPlayer (Music music) = HH.iframe [ HP.class_ $ HH.ClassName "musicPlayer", HP.src $
  "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"<> show music.soundTrackId <> "&color=%23a8233e&auto_play=true&hide_related=false&show_comments=false&show_user=false&show_playcount=false&show_reposts=false&show_teaser=false&show_artwork=true&visual=true"
    ]