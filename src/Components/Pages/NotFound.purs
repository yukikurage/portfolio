module YukiPortfolio.Components.Pages.NotFound where

import Prelude

import Halogen (Component)
import Halogen.Hooks as Hooks
import YukiPortfolio.Components.HTML.ErrorMessage (errorMessage)

component :: forall q i o m. Component q i o m
component = Hooks.component \_ _ -> Hooks.pure $ errorMessage "ページが見つかりませんでした" "\n( ^-^)_旦\"\""