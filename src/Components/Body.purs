module YukiPortfolio.Components.Body where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Pages.Musics as Musics
import Halogen.Hooks as Hooks

component :: forall query input output m. MusicHandler m => H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  musicsPage <- Musics.useMusicsPage
  Hooks.pure $ HH.div_ [musicsPage]