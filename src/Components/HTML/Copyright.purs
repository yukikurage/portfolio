module YukiPortfolio.Components.HTML.Copyright where

import Halogen.HTML (HTML, p, text)
import YukiPortfolio.Components.Common (css)

copyright :: forall w i. HTML w i
copyright = p [css "copyright"] [text "©︎ 2021-2021 ゆきくらげ"]