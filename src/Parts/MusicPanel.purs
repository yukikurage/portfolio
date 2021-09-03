module YukiPortfolio.Parts.MusicPanel where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Types.Contents.Music (Music(..))

part :: forall w i. Music -> HH.HTML w i
part (Music music) =
  HH.div
    [ HP.class_ $ HH.ClassName "musicPanel"
    ]
    [ HH.p_ [ HH.img [ HP.src music.thumbnail ] ]
    , HH.p_
        [ HH.h3_ [ HH.text "Title" ]
        , HH.p_ [ HH.text music.title ]
        , HH.h3_ [ HH.text "Composer" ]
        , HH.p_ [ HH.text music.composer ]
        , HH.h3_ [ HH.text "Description" ]
        , HH.p_ [ HH.text music.description ]
        ]
    ]
