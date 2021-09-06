module YukiPortfolio.Hooks.UseHash where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Halogen (liftEffect)
import Halogen.Hooks (type (<>))
import Halogen.Hooks as Hooks
import Halogen.Query.Event as HQE
import Routing.Hash (getHash)
import Web.Event.Event (EventType(..))
import Web.HTML as HTML
import Web.HTML.Window as Window
import YukiPortfolio.Data.Pages (Pages(..), hashToPage)

type UseHash = Hooks.UseState Pages <> Hooks.UseEffect <> Hooks.Pure

useHash :: forall m. MonadEffect m => Hooks.Hook m UseHash Pages
useHash = Hooks.do
  nowPage /\ nowPageId <- Hooks.useState NotFound

  Hooks.useLifecycleEffect do
    subscription <- subscribeToHashChange (Hooks.put nowPageId)
    pure $ Just $ Hooks.unsubscribe subscription

  Hooks.pure nowPage

  where
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
