module YukiPortfolio.Classes.PicturesHandler where

import Prelude
import YukiPortfolio.Data.Picture (Picture)

class
  Monad m <= PicturesHandler m where
  getPictures :: m (Array Picture)
