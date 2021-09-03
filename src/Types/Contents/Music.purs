module YukiPortfolio.Types.Contents.Music where

newtype Music
  = Music
  { title :: String
  , composer :: String
  , hyperlink :: String
  , description :: String
  , thumbnail :: String
  }
