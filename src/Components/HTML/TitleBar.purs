module YukiPortfolio.Components.HTML.TitleBar where

import Prelude hiding (div)

import Halogen.HTML (HTML, a, div, i, img, text)
import Halogen.HTML.Properties (href, rel, src, target)
import YukiPortfolio.Components.Common (css)

titleBar :: forall w i. HTML w i
titleBar =
  div [css "w-full h-14 px-5 bg-center bg-title-bg bg-cover relative before:bg-yukiBlack before:opacity-80 before:absolute before:inset-0 pointer-events-auto"]
  [ div [css "flex items-center justify-start relative w-full h-full"]
    [ img [css "h-2/3 w-auto", src "./images/icon512_white.png"]
    , div [css "max-h-full w-auto font-title text-[white] text-4xl whitespace-nowrap flex-grow"] [text "YUKI WORKS"]
    , socialIcon "fab fa-twitter" "https://twitter.com/yukikurage_2019"
    , socialIcon "fab fa-soundcloud" "https://soundcloud.com/yukikurage"
    , socialIcon "fab fa-youtube" "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w"
    , socialIcon "fab fa-github" "https://github.com/yukikurage"
    ]
  ]

socialIcon :: forall w i. String -> String -> HTML w i
socialIcon str link = a [css "contents", href link, target "_blank", rel "noopener"]
  [i [css $ "w-14 text-[white] text-2xl text-center cursor-pointer duration-100 flex items-center justify-center h-full hover:scale-110 " <> str] []]
