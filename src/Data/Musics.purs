module YukiPortfolio.Data.Musics where

import Prelude

import Data.Array (replicate)
import Data.Maybe (Maybe(..))
import YukiPortfolio.Types.Contents.Music (Music(..))

musics :: Array Music
musics =
  map Music $ replicate 10
    { title: "Junkbox"
      , composer: "ゆきくらげ"
      , description: "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト"
      , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-junkbox"
      , thumbnail: "/public/images/Junkbox.png"
      , soundTrackId: Just 1067406727
    }
