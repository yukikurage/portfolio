module YukiPortfolio.Components.HTML.ErrorMessage where

import Halogen.HTML (h1_, text)
import Halogen.HTML as HH
import YukiPortfolio.Components.Common (css)

errorMessage :: forall w i. String -> String -> HH.HTML w i
errorMessage title description =
  HH.div
    [ css "text-center"
    ]
    [ h1_ [text title]
    , text description
    ]
