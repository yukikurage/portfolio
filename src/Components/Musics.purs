module YukiPortfolio.Pages.Musics where

import Prelude

import Data.Array (replicate, singleton)
import Data.Either (Either(..), either)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Type.Proxy (Proxy(..))
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Parts.ErrorMessage as ErrorMessage
import YukiPortfolio.Parts.MusicPanel as MusicPanel
import YukiPortfolio.Types.Contents.Music (Music)

type Slot id
  = forall q. H.Slot q Void id

_proxy = Proxy :: Proxy "musics"

component :: forall q i o m. MusicHandler m => H.Component q i o m
component =
  Hooks.component \_ _ -> Hooks.do
    musics /\ musicsId <- Hooks.useState $ (Left "音楽情報を取得しています" :: Either String (Array Music))
    Hooks.useLifecycleEffect do
      Hooks.put musicsId =<< lift getMusics
      pure Nothing
    Hooks.pure
      $ HH.div
          [ HP.class_ $ H.ClassName "musicPanels"
          ]
      $ either (ErrorMessage.part >>> singleton) (map MusicPanel.part >>> (_ <> dummies)) musics
  where
    dummies = replicate 4 $HH.div[ HP.class_ $ H.ClassName "musicPanel" ] [HH.text ""]
