module YukiPortfolio.Components.Head where

import Prelude
import Halogen as H
import Halogen.HTML.CSS as HC
import Halogen.Hooks as Hooks
import YukiPortfolio.Styles.StyleSheet (style)


component :: forall query input output m. H.Component query input output m
component = Hooks.component \_ _ -> Hooks.pure $ HC.stylesheet style