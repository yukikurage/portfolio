module YukiPortfolio.Components.HTML.NavigationBar where

import Prelude

import Data.Functor (mapFlipped)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Pages (Pages, pageToHash, showPage)

navigationBar :: forall w i. Array Pages -> Pages -> HH.HTML w i
navigationBar pages now = HH.div [css $ "navigationBar"] $
  mapFlipped pages \page -> HH.a
    [ HP.href $ "#" <> pageToHash page
    , css $ if now == page then"nowPage" else "otherPage"
    ]
    [ HH.text $ showPage page]