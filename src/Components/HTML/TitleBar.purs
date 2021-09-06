module YukiPortfolio.Components.HTML.TitleBar where

import Prelude hiding (div)

import Halogen.HTML (HTML, a, div, i, img, text)
import Halogen.HTML.Properties (href, rel, src, target)
import YukiPortfolio.Components.Common (css)

titleBar :: forall w i. HTML w i
titleBar =
  div [css "titleBar"]
  [ div [css "content"]
    [ img [css "icon", src "./public/images/icon512_white.png"]
    , div [css "yukikurage"] [text "KURAGE WORKS"]
    , socialIcon "fab fa-twitter" "https://twitter.com/yukikurage_2019"
    , socialIcon "fab fa-soundcloud" "https://soundcloud.com/yukikurage"
    , socialIcon "fab fa-youtube" "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w"
    , socialIcon "fab fa-github" "https://github.com/yukikurage"
    ]
  ]

socialIcon :: forall w i. String -> String -> HTML w i
socialIcon str link = a [css "socialIconLink", href link, target "_blank", rel "noopener"]
  [i [css $ "socialIcon " <> str] []]
