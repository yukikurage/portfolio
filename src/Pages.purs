module YukiPortfolio.Pages where

data Pages =
  About |
  Musics |
  Pictures |
  WebApps |
  NotFound

pageToHash :: Pages -> String
pageToHash = case _ of
  About -> "about"
  Musics -> "musics"
  Pictures -> "pictures"
  WebApps -> "webapps"
  NotFound -> "notFound"

hashToPage :: String -> Pages
hashToPage = case _ of
  "about" -> About
  "musics" -> Musics
  "pictures" -> Pictures
  "webapps" -> WebApps
  _ -> NotFound