module YukiPortfolio.Components.MusicPanel where

import Prelude

import CSS (CSS, background, backgroundColor, backgroundPosition, backgroundRepeat, byClass, cursor, height, img, maxHeight, noRepeat, pct, placed, sideCenter, star, transitionDuration, url, width, (&), (?))
import CSS.Common (auto)
import CSS.Cursor (pointer)
import CSS.TextAlign (center, textAlign)
import Control.Monad.Trans.Class (lift)
import Data.Array (index, mapWithIndex, updateAt)
import Data.Maybe (fromMaybe)
import Data.Tuple.Nested ((/\))
import Effect.Class (class MonadEffect)
import Effect.Class.Console (log, logShow)
import Halogen as H
import Halogen.HTML (HTML)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import Halogen.Hooks as Hooks
import Halogen.HTML.CSS as HC
import Halogen.Hooks.Hook (type (<>))
import YukiPortfolio.Data.Music (Music(..))
import YukiPortfolio.Data.MusicPlayerState (MusicPlayerState(..))

type UseMusicPanel = (Hooks.UseState Boolean) <> Hooks.Pure
type UseMusicPanels = (Hooks.UseState (Array Boolean)) <> Hooks.Pure

musicPanel :: forall q i o m. Music -> (MusicPlayerState -> Hooks.HookM m Unit) -> H.Component q i o m
musicPanel (Music music) setNowPlaying = Hooks.component \_ _ -> Hooks.do
  isLoad /\ isLoadId <- Hooks.useState false
  Hooks.pure $ HH.div [HP.class_ $ HH.ClassName "musicPanel"]
    [ HH.div
      [ HP.class_ $ HH.ClassName "musicPanelInner"
      , HE.onClick (\_ -> setNowPlaying $ Playing $ Music music)]
      [ HH.img
        [ HP.src music.thumbnail
        , HP.width 200
        , HP.height 200
        , HE.onLoad \_ -> Hooks.put isLoadId true
        , HP.style $ if isLoad then "opacity:1" else "opacity:0"
        ]
      , HH.h4_ [HH.text music.title]
      , HH.p_ [HH.text music.description]
      ]
    ]

useMusicPanels :: forall w m.
  MonadEffect m =>
  Hooks.StateId MusicPlayerState -> Array Music ->
  Hooks.Hook m UseMusicPanels (Array (HTML w (Hooks.HookM m Unit)))
useMusicPanels nowPlayingId musics = Hooks.do
  isLoads /\ isLoadsId <- Hooks.useState (map (\_ -> false) musics)

  Hooks.pure $ mapWithIndex (\i (Music music) -> HH.div [HP.class_ $ HH.ClassName "musicPanel"]
    [ HH.div
      [ HP.class_ $ HH.ClassName "musicPanelInner"
      , HE.onClick (\_ -> Hooks.put nowPlayingId (Playing $ Music music))]
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
      , HH.h4_ [HH.text music.title]
      , HH.p_ [HH.text music.description]
      ]
    ]) musics