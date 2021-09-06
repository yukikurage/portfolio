module YukiPortfolio.Data.Music where

import Data.Maybe (Maybe)

newtype Music
  = Music
  { title :: String
  , composer :: String
  , hyperlink :: String
  , description :: String
  , thumbnail :: String
  , soundTrackId :: Maybe Int
  }
