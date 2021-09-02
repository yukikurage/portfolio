module YukiPortfolio.Types.Contents.Music where

newtype Music
  = Music
  { author :: String
  , hyperlink :: String
  , description :: String
  , thumbnail :: String
  }
