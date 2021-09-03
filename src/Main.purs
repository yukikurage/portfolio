module Main where

import Prelude
import Effect (Effect)
import Effect.Aff (launchAff_)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import YukiPortfolio.App (runApp)
import YukiPortfolio.Components.Root as Root

main :: Effect Unit
main =
  launchAff_ do
    body <- HA.awaitBody
    root <- runApp Root.component
    runUI root unit body
