module YukiPortfolio.App where

import Prelude

import Effect.Aff (Aff)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect, liftEffect)
import Halogen as H
import Routing.Hash (setHash)
import Safe.Coerce (coerce)
import YukiPortfolio.Classes.MusicHandler (class MusicHandler)
import YukiPortfolio.Classes.NavigationHandler (class NavigationHandler)
import YukiPortfolio.Classes.PicturesHandler (class PicturesHandler)
import YukiPortfolio.Contents.Musics as Musics
import YukiPortfolio.Contents.Pictures as Pictures
import YukiPortfolio.Data.Pages (pageToHash)

newtype App a
  = Cons (Aff a)

derive newtype instance Functor App
derive newtype instance Apply App
derive newtype instance Applicative App
derive newtype instance Bind App
derive newtype instance Monad App
derive newtype instance MonadEffect App
derive newtype instance MonadAff App

runApp :: forall q i o m. Monad m => H.Component q i o App -> Aff (H.Component q i o m)
runApp = pure <<< coerce

instance MusicHandler App where
  getMusics = pure $ Musics.musics

instance NavigationHandler App where
  navigate = liftEffect <<< setHash <<< pageToHash

instance PicturesHandler App where
  getPictures = pure $ Pictures.pictures