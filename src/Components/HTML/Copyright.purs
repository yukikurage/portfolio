module YukiPortfolio.Components.HTML.Copyright where

import Prelude

import Halogen.HTML (ClassName(..), HTML, p, text)
import Halogen.HTML.Properties (class_)

copyright :: forall w i. HTML w i
copyright = p [class_ $ ClassName "copyright"] [text "©︎ 2021-2021 ゆきくらげ"]