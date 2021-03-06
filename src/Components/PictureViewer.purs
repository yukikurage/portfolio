module YukiPortfolio.Components.PictureViewer where

import Prelude hiding (div)

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Halogen (Component)
import Halogen.HTML (div, img)
import Halogen.HTML.Elements.Keyed (div_)
import Halogen.HTML.Events (onClick)
import Halogen.HTML.Properties (src)
import Halogen.Hooks as Hooks
import YukiPortfolio.Components.Common (css)
import YukiPortfolio.Data.Pages (Pages(..))
import YukiPortfolio.Data.Picture (Picture(..))
import YukiPortfolio.Data.PictureViewerState (PictureViewerState(..))
import YukiPortfolio.Hooks.UseHash (useHash)

data Query a = View Picture a

type Input =
  { viewerState :: PictureViewerState
  }

component :: forall i o m. MonadEffect m => Component Query i o m
component = Hooks.component \tokens _ -> Hooks.do
  nowViewing /\ nowViewingId <- Hooks.useState NotViewing

  nowPage <- useHash

  Hooks.useQuery tokens.queryToken case _ of
    View pic a -> do
      Hooks.put nowViewingId $ Viewing pic
      pure (Just a)

  Hooks.captures {nowPage} Hooks.useTickEffect do
    when (nowPage /= Pictures) $ Hooks.put nowViewingId NotViewing
    pure Nothing

  Hooks.pure $ case nowViewing of
      Viewing (Picture pic) -> div [css "relative flex-grow animate-fade-in-quick w-full bg-yukiBlack bg-opacity-70 py-1 min-h-0 pointer-events-auto"
        , onClick \_ -> Hooks.put nowViewingId NotViewing]
        [ img [css "max-h-full max-w-full mx-auto h-auto w-auto block", src pic.src]
        ]
      _ -> div_ []