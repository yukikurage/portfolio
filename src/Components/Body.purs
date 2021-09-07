module YukiPortfolio.Components.Body where

import Prelude

import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Class.Console (log)
import Halogen as H
import Halogen.HTML as HH
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Classes.PicturesHandler (class PicturesHandler)
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Components.HTML.Copyright (copyright)
import YukiPortfolio.Components.HTML.MusicPlayer (musicPlayer)
import YukiPortfolio.Components.HTML.NavigationBar (navigationBar)
import YukiPortfolio.Components.HTML.TitleBar (titleBar)
import YukiPortfolio.Components.Pages.About as About
import YukiPortfolio.Components.Pages.Musics as Musics
import YukiPortfolio.Components.Pages.NotFound as NotFound
import YukiPortfolio.Components.Pages.Pictures (Output(..))
import YukiPortfolio.Components.Pages.Pictures as Pictures
import YukiPortfolio.Components.PictureViewer as PictureViewer
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))
import YukiPortfolio.Data.Pages (Pages(..))
import YukiPortfolio.Data.PictureViewerState (PictureViewerState(..))
import YukiPortfolio.Hooks.UseHash (useHash)

_musics = Proxy :: Proxy "Musics"
_about = Proxy :: Proxy "About"
_pictures = Proxy :: Proxy "Pictures"
_notFound = Proxy :: Proxy "NotFound"
_pictureViewer = Proxy :: Proxy "PictureViewer"

component :: forall query input output m.
  MusicHandler m
  => PicturesHandler m
  => MonadEffect m
  => H.Component query input output m
component = Hooks.component \tokens _ -> Hooks.do
  nowPlaying /\ nowPlayingId <- Hooks.useState NotPlaying

  nowPage <- useHash

  Hooks.pure $ HH.div [css "bodyRoot"]
    [ HH.div [css "static"]
      [ HH.div [css "header"]
        [ titleBar
        , navigationBar [About, Musics, Pictures, WebApps] nowPage
        ]
      , HH.slot_ _pictureViewer unit PictureViewer.component unit
      , musicPlayer nowPlaying
      ]
    , HH.div [css "dynamic"]
      [ HH.div [css "main"]
        [ case nowPage of
            Musics -> HH.slot _musics unit Musics.component unit $ case _ of
              Musics.Play music -> Hooks.put nowPlayingId $ Playing music
            About -> HH.slot_ _about unit About.component unit
            Pictures -> HH.slot _pictures "Pictures" Pictures.component unit $ case _ of
              Pictures.View pic -> do
                Hooks.tell tokens.slotToken _pictureViewer unit $ PictureViewer.View pic
            WebApps -> HH.div_ []
            NotFound -> HH.slot_ _notFound "NotFound" NotFound.component unit
        ]
      , HH.div [css "footer"] [copyright]
      ]
    ]