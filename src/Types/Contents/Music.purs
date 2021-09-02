module YukiPortfolio.Types.Contents.Music where

newtype Music
  = Music
  { title :: String
  , author :: String
  , hyperlink :: String
  , description :: String
  , thumbnail :: String
  }
