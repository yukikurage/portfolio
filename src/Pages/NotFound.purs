module YukiPortfolio.Pages.NotFound where

import Halogen.HTML (HTML, div_, text)

notFound :: forall w i. HTML w i
notFound = div_ [text "Page Not Found!\n( ^-^)_旦\"\""]