module YukiPortfolio.Pages.NotFound where

import Halogen.HTML (HTML)
import YukiPortfolio.Parts.ErrorMessage (errorMessage)

notFound :: forall w i. HTML w i
notFound = errorMessage "ページが見つかりませんでした" "\n( ^-^)_旦\"\""