module YukiPortfolio.Parts.ErrorMessage where

import Prelude
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

errorMessage :: forall w i. String -> HH.HTML w i
errorMessage str =
  HH.div
    [ HP.class_ $ HH.ClassName "error"
    ]
    [ HH.text str
    ]
