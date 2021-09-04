module YukiPortfolio.Parts.TitleBar where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

titleBar :: forall w i. HH.HTML w i
titleBar =
  HH.div [HP.class_ $ H.ClassName "titleBar"]
  [ HH.div [HP.class_ $ H.ClassName "content" ]
    [ HH.img [HP.class_ $ H.ClassName "icon", HP.src "./public/images/icon512_white.png"]
    , HH.div [HP.class_ $ H.ClassName "yukikurage"] [HH.text "YUKI WORKS"]
    ]
  ]