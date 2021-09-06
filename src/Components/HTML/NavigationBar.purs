module YukiPortfolio.Components.HTML.NavigationBar where

import Prelude

import Data.Array (catMaybes)
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Data.Pages (Pages, pageToHash, showPage)

navigationBar :: forall w i. Array Pages -> Pages -> HH.HTML w i
navigationBar pages nowPage = HH.div [HP.class_ $ H.ClassName $ "navigationBar"] $
  map (\page -> HH.a (catMaybes [Just $ HP.href $ "#" <> pageToHash page, if nowPage == page then Just $ HP.class_ $ H.ClassName "nowPage" else Nothing]) 
    [HH.text $ showPage page]) pages