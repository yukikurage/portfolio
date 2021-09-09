module YukiPortfolio.Components.HTML.NavigationBar where

import Prelude

import Data.Functor (mapFlipped)
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Pages (Pages, pageToHash, showPage)

navigationBar :: forall w i. Array Pages -> Pages -> HH.HTML w i
navigationBar pages now = HH.div 
  [css "bg-yukiYellow bg-opacity-80 flex px-3 font-montserrat justify-start"] $
  mapFlipped pages \page -> HH.a
    [ HP.href $ "#" <> pageToHash page
    , css $ "px-3 py-2 text-2xl relative block after:absolute after:bottom-1 after:left-0 after:w-full after:h-0.5 after:bg-yukiRed after:opacity-0 after:invisible after:duration-100 hover:after:opacity-100 hover:after:bottom-0 hover:after:visible " <> if now == page then "text-yukiRed" else "otherPage"
    ]
    [HH.text $ showPage page]