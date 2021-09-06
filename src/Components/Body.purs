module YukiPortfolio.Components.Body where

import Prelude

import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.HTML.Copyright (copyright)
import YukiPortfolio.Components.HTML.MusicPlayer (musicPlayer)
import YukiPortfolio.Components.HTML.NavigationBar (navigationBar)
import YukiPortfolio.Components.HTML.TitleBar (titleBar)
import YukiPortfolio.Components.Pages.About  as About
import YukiPortfolio.Components.Pages.Musics as Musics
import YukiPortfolio.Components.Pages.NotFound as NotFound
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))
import YukiPortfolio.Data.Pages (Pages(..))
import YukiPortfolio.Hooks.UseHash (useHash)

_page = Proxy :: Proxy "page"

component :: forall query input output m. MusicHandler m
  => MonadEffect m
  => H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  nowPlaying /\ nowPlayingId <- Hooks.useState NotPlaying
  nowPage <- useHash

  Hooks.pure $ HH.div [css "bodyRoot"]
    [ HH.div [css "static"]
      [ HH.div [css "header"]
        [ titleBar
        , navigationBar [About, Musics, Pictures, WebApps] nowPage
        ]
      , musicPlayer nowPlaying
      ]
    , HH.div [css "dynamic"]
      [ HH.div [css "main"]
        [ case nowPage of
            Musics -> HH.slot _page "Musics" Musics.component unit $ case _ of
              Musics.Play music -> Hooks.put nowPlayingId $ Playing music
            About -> HH.slot_ _page "About" About.component unit
            Pictures -> HH.div_ []
            WebApps -> HH.div_ []
            NotFound -> HH.slot_ _page "NotFound" NotFound.component unit
        ]
      , HH.div [css "footer"] [copyright]
      ]
    ]