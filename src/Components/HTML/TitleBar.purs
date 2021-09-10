module YukiPortfolio.Components.HTML.TitleBar where

import Prelude hiding (div)

import Halogen.HTML (HTML, a, div, i, img, text)
import Halogen.HTML.Properties (href, rel, src, target)
import YukiPortfolio.Components.Common (css)

titleBar :: forall w i. HTML w i
titleBar =
  div [css "w-full h-auto px-5 bg-center bg-title-bg bg-cover relative before:bg-[white] before:opacity-0 before:absolute before:inset-0 pointer-events-auto overflow-hidden"]
  [ div [css "flex items-center justify-start relative w-full h-full"]
    [ img [css "h-12 w-auto", src "./images/icon512_black.png"]
    , div [css "none hidden h-14 max-h-full w-auto font-title text-yukiBlack text-[44px] whitespace-nowrap sm:flex items-center"] [text "YUKI WORKS"]
    , div [css "w-full sm:w-auto sm:flex-grow"] []--Fill
    , socialIcon "bg-twitter" "fab fa-twitter" "https://twitter.com/yukikurage_2019"
    , socialIcon "bg-soundcloud" "fab fa-soundcloud" "https://soundcloud.com/yukikurage"
    , socialIcon "bg-youtube" "" {-"fab fa-youtube"-} "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w"
    , socialIcon "bg-github" "fab fa-github" "https://github.com/yukikurage"
    ]
  ]

socialIcon :: forall w i. String -> String -> String -> HTML w i
socialIcon col str link = a [css $ "h-auto", href link, target "_blank", rel "noopener"]
  [i [css $ "mx-1.5 w-14 text-[white] text-2xl text-center duration-100 flex items-center justify-center h-14 hover:scale-110 " <> str <> " " <> col] []]
