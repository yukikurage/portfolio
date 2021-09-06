module YukiPortfolio.Components.Body where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect, liftEffect)
import Effect.Class.Console (log)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.Query.Event as HQE
import Routing.Hash (getHash)
import Type.Proxy (Proxy(..))
import Web.Event.Event (EventType(..))
import Web.HTML as HTML
import Web.HTML.Window as Window
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Components.HTML.Copyright (copyright)
import YukiPortfolio.Components.HTML.MusicPlayer (musicPlayer)
import YukiPortfolio.Components.HTML.NavigationBar (navigationBar)
import YukiPortfolio.Components.HTML.TitleBar (titleBar)
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))
import YukiPortfolio.Data.Pages (Pages(..), hashToPage)
import YukiPortfolio.Pages.About (about)
import YukiPortfolio.Pages.Musics as Musics
import YukiPortfolio.Pages.NotFound (notFound)

_page = Proxy :: Proxy "page"

component :: forall query input output m. MusicHandler m
  => MonadEffect m
  => H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  nowPlaying /\ nowPlayingId <- Hooks.useState NotPlaying
  nowPage /\ nowPageId <- Hooks.useState NotFound

  Hooks.useLifecycleEffect do
    Hooks.put nowPageId <<< hashToPage =<< liftEffect getHash

    log =<< liftEffect getHash

    subscription <- subscribeToHashChange (Hooks.put nowPageId)
    pure $ Just $ Hooks.unsubscribe subscription

  Hooks.pure $ HH.div [HP.class_ $ H.ClassName "bodyRoot"]
    [ HH.div [HP.class_ $ H.ClassName "static"]
      [ HH.div [HP.class_ $ H.ClassName "header"]
        [ titleBar
        , navigationBar [About, Musics, Pictures, WebApps] nowPage
        ]
      , musicPlayer nowPlaying
      ]
    , HH.div [HP.class_ $ H.ClassName "dynamic"]
      [ HH.div [HP.class_ $ H.ClassName "main"]
        [ case nowPage of
            Musics -> HH.slot _page "musics" Musics.component unit $ case _ of
              Musics.Play music -> Hooks.put nowPlayingId $ Playing music
            About -> about
            Pictures -> HH.div_ []
            WebApps -> HH.div_ []
            NotFound -> notFound
        ]
      , HH.div [HP.class_ $ H.ClassName "footer"]
        [
          copyright
        ]
      ]
    ]
  where
    subscribeToHashChange :: (Pages -> Hooks.HookM m Unit) -> Hooks.HookM m H.SubscriptionId
    subscribeToHashChange setPage = do
      window <- liftEffect HTML.window
      subscriptionId <- Hooks.subscribe do
        HQE.eventListener
          (EventType "hashchange")
          (Window.toEventTarget window)
          ( \_ -> Just do
            hash <- liftEffect getHash
            setPage $ hashToPage hash
          )

      hash <- liftEffect getHash
      setPage $ hashToPage hash
      pure subscriptionId
