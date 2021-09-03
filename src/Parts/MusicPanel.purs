module YukiPortfolio.Parts.MusicPanel where

import Prelude

import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Types.Contents.Music (Music(..))


part :: forall w i. Music -> HH.HTML w i
part (Music music) = HH.div [ HP.class_ $ HH.ClassName "musicPanel" ] [ HH.img [ HP.src music.thumbnail ] ]