module YukiPortfolio.Classes.NavigationHandler where

import Prelude

import YukiPortfolio.Types.Pages (Pages)

class Monad m <= NavigationHandler m where
  navigate :: Pages -> m Unit