module YukiPortfolio.Components.Common where

import Prelude
import Halogen as H
import Halogen.HTML.Properties as HP

css :: forall r i. String -> HP.IProp (class :: String | r) i
css = HP.class_ <<< H.ClassName