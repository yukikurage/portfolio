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
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Parts.ErrorMessage as ErrorMessage
import YukiPortfolio.Parts.MusicPanel as MusicPanel
import YukiPortfolio.Types.Contents.Music (Music)

type UseMusicsPage =
  Hooks.UseState (Either String (Array Music))
  Hooks.<>
  Hooks.UseEffect
  Hooks.<>
  Hooks.Pure

useMusicsPage :: forall m t53 t54. Monad m =>
  MusicHandler m =>
  Hooks.Hook m UseMusicsPage (HH.HTML t53 t54)
useMusicsPage = Hooks.do
    musics /\ musicsId <- Hooks.useState $ (Left "曲情報を取得しています" :: Either String (Array Music))
    Hooks.useLifecycleEffect do
      Hooks.put musicsId =<< lift getMusics
      pure Nothing
    Hooks.pure
      $ HH.div
          [ HP.class_ $ H.ClassName "musicPanels"
          ]
      $ either (ErrorMessage.errorMessage >>> singleton) (map MusicPanel.musicPanel >>> (_ <> dummies)) musics
  where
    dummies = replicate 4 $ HH.div[ HP.class_ $ H.ClassName "musicPanel" ] [HH.text ""]
