module YukiPortfolio.Parts.Panels.Music where

import Prelude
import Halogen.HTML as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Types.Contents.Music (Music(..))

mkPanel :: forall w i. Music -> HH.HTML w i
mkPanel (Music music) =
  HH.div
    [ HP.class_ $ H.ClassName "flex"
    ]
    [ HH.p_ [ HH.img [ HP.src music.thumbnail ] ]
    , HH.p_ [ HH.text music.description ]
    ]
