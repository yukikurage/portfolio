module YukiPortfolio.Classes.MusicHandler where

import Prelude
import YukiPortfolio.Data.Music (Music)

class
  Monad m <= MusicHandler m where
  getMusics :: m (Array Music)
