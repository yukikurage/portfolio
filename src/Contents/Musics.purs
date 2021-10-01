module YukiPortfolio.Contents.Musics where

import Prelude

import Data.Maybe (Maybe(..))
import YukiPortfolio.Data.Music (Music(..))

musics :: Array Music
musics =
  map Music
  [ { title: "Ficuser Science Laboratory"
    , composer: "ゆきくらげ"
    , description: "架空の実験施設がテーマ"
    , hyperlink: "https://soundcloud.com/yukikurage/ficuser-science-laboratory"
    , thumbnail: "./images/thumbnail/FSL.png"
    , soundTrackId: Just 1111168981
    },
    { title: "キャンディ・ラビリンス"
    , composer: "ゆきくらげ"
    , description: "カートゥーン調の狂った曲"
    , hyperlink: "https://soundcloud.com/yukikurage/candy_labyrinth"
    , thumbnail: "./images/thumbnail/candy.png"
    , soundTrackId: Just 1106772784
    },
    { title: "Junkbox"
    , composer: "ゆきくらげ"
    , description: "無計画に曲を作るとこうなる"
    , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-junkbox"
    , thumbnail: "./images/thumbnail/Junkbox.png"
    , soundTrackId: Just 1067406727
    },
    { title: "チョコレート・ファンタジア"
    , composer: "ゆきくらげ"
    , description: "カートゥーン調の楽しい曲"
    , hyperlink: "https://soundcloud.com/yukikurage/chocolate-fantasia"
    , thumbnail: "./images/thumbnail/Chocolate.png"
    , soundTrackId: Just 1042134349
    },
    { title: "Spaghetti Code"
    , composer: "ゆきくらげ"
    , description: "一日で作った小曲"
    , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-spaghetti-code"
    , thumbnail: "./images/thumbnail/spaghetti.png"
    , soundTrackId: Just 1005226894
    },
    { title: "Departure"
    , composer: "ゆきくらげ"
    , description: "デカイ曲"
    , hyperlink: "https://soundcloud.com/yukikurage/departure"
    , thumbnail: "./images/thumbnail/DEP.png"
    , soundTrackId: Just 1004784478
    },
    { title: "ALTF4"
    , composer: "ゆきくらげ"
    , description: "高校時代最後の曲"
    , hyperlink: "https://soundcloud.com/yukikurage/altf4"
    , thumbnail: "./images/thumbnail/ctrl.png"
    , soundTrackId: Just 858385549
    },
    { title: "Angels Cry"
    , composer: "ゆきくらげ"
    , description: "音ゲーにありそうな曲"
    , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-angel-cry"
    , thumbnail: "./images/thumbnail/Angel Cry.png"
    , soundTrackId: Just 842971960
    },
    { title: "SleepingMoon"
    , composer: "ゆきくらげ"
    , description: "しんみり曲"
    , hyperlink: "https://soundcloud.com/yukikurage/sleepingmoon"
    , thumbnail: "./images/thumbnail/Sleep.png"
    , soundTrackId: Just 834517414
    },
    { title: "psychorain"
    , composer: "ゆきくらげ"
    , description: "ヤバイ曲"
    , hyperlink: "https://soundcloud.com/yukikurage/yukikurage-psychorain"
    , thumbnail: "./images/thumbnail/psychorain.png"
    , soundTrackId: Just 783712738
    },
    { title: "Deep Blue"
    , composer: "ゆきくらげ"
    , description: "これすき"
    , hyperlink: "https://soundcloud.com/yukikurage/deep-blue"
    , thumbnail: "./images/thumbnail/DeepBlue.png"
    , soundTrackId: Just 776421145
    },
    { title: "UNTITLED"
    , composer: "ゆきくらげ"
    , description: "かなり気に入ってるSwing曲"
    , hyperlink: "https://soundcloud.com/yukikurage/untitled"
    , thumbnail: "./images/thumbnail/UNTITLED.png"
    , soundTrackId: Just 774690913
    },
    { title: "Invoker"
    , composer: "ゆきくらげ"
    , description: "単純な音を使った曲"
    , hyperlink: "https://soundcloud.com/yukikurage/involker"
    , thumbnail: "./images/thumbnail/Invoker_ICON.png"
    , soundTrackId: Just 773565526
    },
    { title: "KILLER TECH"
    , composer: "ゆきくらげ"
    , description: "Hitech作りたかったけど作れなかった"
    , hyperlink: "https://soundcloud.com/yukikurage/yukino-kurage-killer-tech"
    , thumbnail: "./images/thumbnail/KillerTech.png"
    , soundTrackId: Just 758140564
    },
    { title: "Swingbox"
    , composer: "ゆきくらげ"
    , description: "一番Electro Swingっぽい"
    , hyperlink: "https://soundcloud.com/yukikurage/swingbox"
    , thumbnail: "./images/thumbnail/signed.png"
    , soundTrackId: Just 731886658
    },
    { title: "Sound Zip"
    , composer: "ゆきくらげ"
    , description: "明るい曲"
    , hyperlink: "https://soundcloud.com/yukikurage/sound-zip"
    , thumbnail: "./images/thumbnail/YUKI.png"
    , soundTrackId: Just 710530633
    },
    { title: "False Heaven"
    , composer: "ゆきくらげ"
    , description: "自分の曲の方向性を決めた曲"
    , hyperlink: "https://soundcloud.com/yukikurage/2019-09-23-3a"
    , thumbnail: "./images/thumbnail/Default.png"
    , soundTrackId: Just 685401529
    },
    { title: "True Ending"
    , composer: "ゆきくらげ"
    , description: "泣き曲"
    , hyperlink: "https://soundcloud.com/yukikurage/true-ending"
    , thumbnail: "./images/thumbnail/TrueEnding.png"
    , soundTrackId: Just 661863035
    },
    { title: "Star Night Fantasia"
    , composer: "ゆきくらげ"
    , description: "ピアノが主体のクラッシック曲"
    , hyperlink: "https://soundcloud.com/yukikurage/star-night-fantasia"
    , thumbnail: "./images/thumbnail/Starnight.jpg"
    , soundTrackId: Just 656991557
    },
    { title: "或るロボットの為の夢想曲"
    , composer: "ゆきくらげ"
    , description: "泣けるクラッシック調の曲"
    , hyperlink: "https://soundcloud.com/yukikurage/3yjpvatwekyx"
    , thumbnail: "./images/thumbnail/robot.jpg"
    , soundTrackId: Just 649547930
    }
  ]
