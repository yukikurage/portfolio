module YukiPortfolio.Data.Picture where

data Picture = Picture
  { width :: Int
  , height :: Int
  , src :: String
  , title :: String
  }