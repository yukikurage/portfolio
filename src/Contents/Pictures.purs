module YukiPortfolio.Contents.Pictures where

import Prelude

import YukiPortfolio.Data.Picture (Picture(..))

pictures :: Array Picture
pictures = map Picture
  [ { title:"彩夢"
    , height: 1117
    , width: 1000
    , src: "./public/images/pictures/ayu.png"
    }
  , { title:"ドット絵"
    , height: 540
    , width: 540
    , src: "./public/images/pictures/Dot絵.png"
    }
  , { title:"キャンディ・ラビリンス"
    , height: 540
    , width: 540
    , src: "./public/images/pictures/candy_no_logo.png"
    }
  , { title:"彩夢"
    , height: 1117
    , width: 1000
    , src: "./public/images/pictures/ayu.png"
    }
  , { title:"ドット絵"
    , height: 540
    , width: 540
    , src: "./public/images/pictures/Dot絵.png"
    }
  , { title:"キャンディ・ラビリンス"
    , height: 540
    , width: 540
    , src: "./public/images/pictures/candy_no_logo.png"
    }
  ]