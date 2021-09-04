module YukiPortfolio.Classes.NavigationHandler where

import Prelude

import YukiPortfolio.Types.Page (Pages)

class Monad m <= NavigationHandler m where
  navigate :: Pages -> m Unit