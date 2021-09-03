module YukiPortfolio.Classes.NavigationHandler where

import Prelude

class Monad m <= NavigationHandler m where
  navigate :: String -> m Unit