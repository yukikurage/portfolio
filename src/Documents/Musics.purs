module YukiPortfolio.Documents.Musics where

import Prelude

import Data.Maybe (Maybe(..))
import YukiPortfolio.Data.Music (Music(..))

musics :: Array Music
musics =
  map Music
  [
    { title: "Junkbox"
      , composer: "ゆきくらげ"
      , description: "無計画に曲を作るとこうなる"
      , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-junkbox"
      , thumbnail: "./public/images/thumbnail/Junkbox.png"
      , soundTrackId: Just 1067406727
    },
    { title: "Ficuser Science Laboratory"
      , composer: "ゆきくらげ"
      , description: "架空の実験施設がテーマ"
      , hyperlink: "https://soundcloud.com/yukikurage/ficuser-science-laboratory"
      , thumbnail: "./public/images/thumbnail/FSL.png"
      , soundTrackId: Just 1111168981
    }
  ]
