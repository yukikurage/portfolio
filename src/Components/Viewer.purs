module YukiPortfolio.Components.Viewer where

import Prelude

import Halogen.HTML (div_)
import Halogen.Hooks as Hooks

component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ div_ []