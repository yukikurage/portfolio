module YukiPortfolio.Components.HTML.ErrorMessage where

import Prelude

import Halogen.HTML (h1_, text)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

errorMessage :: forall w i. String -> String -> HH.HTML w i
errorMessage title description =
  HH.div
    [ HP.class_ $ HH.ClassName "errorMessage"
    ]
    [ h1_ [text title]
    , text description
    ]
