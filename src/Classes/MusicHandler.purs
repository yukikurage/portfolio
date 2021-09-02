module YukiPortfolio.Classes.MusicHandler where

import Prelude
import Data.Either (Either)
import YukiPortfolio.Types.Contents.Music (Music)

class
  Monad m <= MusicHandler m where
  getMusics :: m (Either String (Array Music))
