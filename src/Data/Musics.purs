module YukiPortfolio.Data.Musics where

import Prelude
import YukiPortfolio.Types.Contents.Music (Music(..))

musics :: Array Music
musics =
  map Music
    [ { title: "Junkbox"
      , composer: "ゆきくらげ"
      , description: "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト"
      , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-junkbox"
      , thumbnail: "/public/images/Junkbox.png"
      }
    ]
