module Main where

import Prelude
import Data.Foldable (traverse_)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Web.DOM.ParentNode (QuerySelector(..))
import YukiPortfolio.App (runApp)
import YukiPortfolio.Components.Body as Body
import YukiPortfolio.Styles.StyleSheet as StyleSheet

main :: Effect Unit
main =
  launchAff_ do
    HA.awaitLoad
    styleSheet <- runApp StyleSheet.component
    body <- runApp Body.component
    traverse_ (runUI styleSheet unit) =<< HA.selectElement (QuerySelector "head")
    traverse_ (runUI body unit) =<< HA.selectElement (QuerySelector "body")
