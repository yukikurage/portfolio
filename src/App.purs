module YukiPortfolio.App where

import Prelude

import Data.Either (Either(..))
import Effect.Aff (Aff)
import Effect.Aff.Class (class MonadAff)
import Effect.Class (class MonadEffect)
import Halogen as H
import Safe.Coerce (coerce)
import YukiPortfolio.Classes.MusicHandler (class MusicHandler, getMusics)
import YukiPortfolio.Data.Musics as Musics

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
  getMusics = pure $ Right $ Musics.musics