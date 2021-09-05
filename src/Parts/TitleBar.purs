module YukiPortfolio.Parts.TitleBar where

import Prelude

import Halogen (PropName(..))
import Halogen as H
import Halogen.HTML (class IsProp, HTML, IProp, a, div, i, iframe, img, prop, text)
import Halogen.HTML.Properties (class_, href, rel, src, target)

titleBar :: forall w i. HTML w i
titleBar =
  div [class_ $ H.ClassName "titleBar"]
  [ div [class_ $ H.ClassName "content"]
    [ img [class_ $ H.ClassName "icon", src "./public/images/icon512_white.png"]
    , div [class_ $ H.ClassName "yukikurage"] [text "YUKI WORKS"]
    , socialIcon "fab fa-twitter" "https://twitter.com/yukikurage_2019"
    , socialIcon "fab fa-soundcloud" "https://soundcloud.com/yukikurage"
    , socialIcon "fab fa-youtube" "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w"
    ]
  ]

socialIcon :: forall w i. String -> String -> HTML w i
socialIcon str link = a [class_ $ H.ClassName "socialIconLink", href link, target "_blank", rel "noopener"]
  [i [class_ $ H.ClassName $ "socialIcon " <> str] []]
