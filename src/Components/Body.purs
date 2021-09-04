module YukiPortfolio.Components.Body where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect, liftEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.Query.Event as HQE
import Routing.Hash (getHash)
import Web.Event.Event (EventType(..))
import Web.HTML as HTML
import Web.HTML.Window as Window
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Types.Pages (Pages(..), hashToPage)
import YukiPortfolio.Types.Pages.Musics (useMusicsPage)
import YukiPortfolio.Parts.MusicPlayer (musicPlayer)
import YukiPortfolio.Parts.NavigationBar (navigationBar)
import YukiPortfolio.Types.MusicPlayerState (MusicPlayerState(..))

component :: forall query input output m. MusicHandler m
  => MonadEffect m
  => H.Component query input output m
component = Hooks.component \_ _ -> Hooks.do
  nowPlaying /\ nowPlayingId <- Hooks.useState NotPlaying
  nowPage /\ nowPageId <- Hooks.useState NotFound
  musicsPage <- useMusicsPage nowPlayingId

  Hooks.useLifecycleEffect do
    Hooks.put nowPageId <<< hashToPage =<< liftEffect getHash
    subscription <- subscribeToHashChange (Hooks.put nowPageId)
    pure $ Just $ Hooks.unsubscribe subscription

  Hooks.pure $ HH.div [HP.class_ $ H.ClassName "bodyRoot"]
    [ navigationBar [About, Musics, Pictures, WebApps] nowPage
    , if nowPage == Musics
        then musicsPage
        else HH.div_ []
    , musicPlayer nowPlaying
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
