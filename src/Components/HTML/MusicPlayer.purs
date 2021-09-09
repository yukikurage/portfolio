module YukiPortfolio.Components.HTML.MusicPlayer where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Music (Music(..))
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))

musicPlayer :: forall w i. MusicPlayerState -> HH.HTML w i
musicPlayer musicPlayerState = case musicPlayerState of
  Playing (Music music) -> case music.soundTrackId of
    Just id -> HH.div_
      [ HH.iframe
        [ css "fixed left-0 bottom-0 right-0 w-full h-28 border-0 z-[45]", HH.prop (HH.PropName "allow") "autoplay", HP.src $ mkSrc id]
      ]
    Nothing -> HH.div_ []
  NotPlaying -> HH.div_ []

mkSrc :: Int -> String
mkSrc id = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"
  <>
  show id
  <>
  "&color=%23a8233e&auto_play=true&hide_related=false&show_comments=false&show_user=false&show_playcount=false&show_reposts=false&show_teaser=false&show_artwork=true"
