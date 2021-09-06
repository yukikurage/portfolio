module YukiPortfolio.Contents.Pictures where

import Prelude

import CSS (height)
import YukiPortfolio.Data.Picture (Picture(..))

pictures :: Array Picture
pictures = map Picture 
  [ { title:"彩夢"
    , height: 1117
    , width: 1000
    , src: "./public/images/pictures/ayu.png"
    }
  ]