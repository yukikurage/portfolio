module YukiPortfolio.Contents.Pictures where

import Prelude

import YukiPortfolio.Data.Picture (Picture(..))

pictures :: Array Picture
pictures = map Picture
  [ { title: "comi"
    , height: 3541
    , width: 2508
    , src: "./images/pictures/comi.png"
    }
  , { title: "hina"
    , height: 2487
    , width: 2487
    , src: "./images/pictures/hina.png"
    }
  , { title: "ラグランジュ"
    , height: 1520
    , width: 1150
    , src: "./images/pictures/raguranzyu.png"
    }
  , { title: "彩夢"
    , height: 1117
    , width: 1000
    , src: "./images/pictures/ayu.png"
    }
  , { title: "ドット絵"
    , height: 540
    , width: 540
    , src: "./images/pictures/Dot絵.png"
    }
  , { title: "キャンディ・ラビリンス"
    , height: 540
    , width: 540
    , src: "./images/pictures/candy_no_logo.png"
    }
  , { title: "FSL ボツ"
    , height: 540
    , width: 540
    , src: "./images/pictures/FSL.png"
    }
  , { title: "2021-424"
    , height: 1000
    , width: 1000
    , src: "./images/pictures/2021-424.png"
    }
  , { title: "いつかのアイコン"
    , height: 1000
    , width: 1000
    , src: "./images/pictures/ICON6.png"
    }
  , { title: "完成させたい"
    , height: 1530
    , width: 1226
    , src: "./images/pictures/IMG_20210204_191350 (2).jpg"
    }
  , { title: "下書き"
    , height: 4046
    , width: 2000
    , src: "./images/pictures/Draft.png"
    }
  , { title: "AUTOMATIX"
    , height: 4092
    , width: 2893
    , src: "./images/pictures/AUTOMATIX.png"
    }
  , { title: "腑に落ちない顔"
    , height: 1000
    , width: 1000
    , src: "./images/pictures/KAKIDASI.png"
    }
  , { title: "TrueEnding"
    , height: 1000
    , width: 1000
    , src: "./images/pictures/TrueEnding.png"
    }
  , { title: "Elements"
    , height: 1000
    , width: 1000
    , src: "./images/pictures/Elements_Notitle.png"
    }
  ]
