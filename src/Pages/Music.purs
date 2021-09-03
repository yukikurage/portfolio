module YukiPortfolio.Pages.Music where

import Prelude
import Data.Array (singleton)
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
          [ HP.class_ $ H.ClassName "vertical"
          ]
      $ either (ErrorMessage.part >>> singleton) (map MusicPanel.part) musics
