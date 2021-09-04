module YukiPortfolio.Pages.Musics where


import Prelude

import Data.Array (replicate, singleton)
import Data.Either (Either(..), either)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Parts.ErrorMessage as ErrorMessage
import YukiPortfolio.Parts.MusicPanel as MusicPanel
import YukiPortfolio.Types.Contents.Music (Music)
import YukiPortfolio.Types.MusicPlayerState (MusicPlayerState)

type UseMusicsPage =
  Hooks.UseState (Either String (Array Music))
  Hooks.<>
  Hooks.UseEffect
  Hooks.<>
  Hooks.Pure

useMusicsPage :: forall w m. Monad m =>
  MusicHandler m =>
  MonadEffect m =>
  Hooks.StateId MusicPlayerState ->
  Hooks.Hook m UseMusicsPage (HH.HTML w (Hooks.HookM m Unit))
useMusicsPage nowPlayingId = Hooks.do
    musics /\ musicsId <- Hooks.useState $ (Left "曲情報を取得しています" :: Either String (Array Music))
    Hooks.useLifecycleEffect do
      Hooks.put musicsId =<< lift getMusics
      pure Nothing
    Hooks.pure
      $ HH.div
          [ HP.class_ $ H.ClassName "musics"
          ]
      $ either (ErrorMessage.errorMessage "曲情報が取得できませんでした" >>> singleton) (map (\music -> MusicPanel.musicPanel music nowPlayingId) >>> (_ <> dummies)) musics
  where
    dummies = replicate 4 $ HH.div [ HP.class_ $ H.ClassName "musicPanel" ] [HH.text ""]
