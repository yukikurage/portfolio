module YukiPortfolio.Components.HTML.TitleBar where

import Prelude hiding (div)

import Halogen (ClassName(..))
import Halogen.HTML (HTML, a, div, i, img, text)
import Halogen.HTML.Properties (class_, href, rel, src, target)

titleBar :: forall w i. HTML w i
titleBar =
  div [class_ $ ClassName "titleBar"]
  [ div [class_ $ ClassName "content"]
    [ img [class_ $ ClassName "icon", src "./public/images/icon512_white.png"]
    , div [class_ $ ClassName "yukikurage"] [text "YUKI WORKS"]
    , socialIcon "fab fa-twitter" "https://twitter.com/yukikurage_2019"
    , socialIcon "fab fa-soundcloud" "https://soundcloud.com/yukikurage"
    , socialIcon "fab fa-youtube" "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w"
    ]
  ]

socialIcon :: forall w i. String -> String -> HTML w i
socialIcon str link = a [class_ $ ClassName "socialIconLink", href link, target "_blank", rel "noopener"]
  [i [class_ $ ClassName $ "socialIcon " <> str] []]