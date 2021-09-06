module YukiPortfolio.Pages.Musics where


import Prelude

import Data.Array (index, mapWithIndex, replicate, updateAt)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Effect.Class.Console (log, logShow)
import Halogen (lift)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Data.Music (Music(..))
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))

type UseMusicsPage =
  Hooks.UseState (Array Music)
  Hooks.<>
  Hooks.UseState (Array Boolean)
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
  musics /\ musicsId <- Hooks.useState $ []

  isLoads /\ isLoadsId <- Hooks.useState []

  Hooks.useLifecycleEffect do
    Hooks.put musicsId =<< lift getMusics
    (Hooks.put isLoadsId <<< (map \_ -> false)) =<< lift getMusics
    pure Nothing

  Hooks.pure $ HH.div [ HP.class_ $ H.ClassName "musics"] $ mapWithIndex
    (\i (Music music) -> HH.div [HP.class_ $ HH.ClassName "musicPanel"]
      [ HH.div
        [ HP.class_ $ HH.ClassName "musicPanelInner"
        , HE.onClick (\_ -> Hooks.put nowPlayingId (Playing $ Music music))]
        [ HH.div [HP.class_ $ H.ClassName "imgWrapper"]
          [ HH.img
            [ HP.src music.thumbnail
            , HP.width 200
            , HP.height 200
            , HE.onLoad \_ -> do
              lift $ log "loaded"
              lift $ logShow isLoads
              Hooks.modify_ isLoadsId (\xs -> fromMaybe xs $ updateAt i true xs)
              lift $ logShow isLoads
            , HP.style $ if fromMaybe false $ index isLoads i then "opacity:1" else "opacity:0"
            ]
          ]
        , HH.h4_ [HH.text music.title]
        , HH.p_ [HH.text music.description]
      ]
    ]) musics <> dummies
  where
    dummies = replicate 4 $ HH.div [ HP.class_ $ H.ClassName "musicPanel" ] [HH.text ""]
