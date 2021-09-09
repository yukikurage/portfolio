module YukiPortfolio.Components.Pages.Links where

import Prelude hiding (div)

import Halogen.HTML (div, text)
import Halogen.Hooks as Hooks

component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ div [] [text "test"]