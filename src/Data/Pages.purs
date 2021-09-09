module YukiPortfolio.Data.Pages where

import Prelude

data Pages =
  About |
  Musics |
  Pictures |
  WebApps |
  Links |
  NotFound

derive instance Eq Pages

showPage :: Pages -> String
showPage = case _ of
  About -> "About"
  Musics -> "Musics"
  Pictures -> "Illustrations"
  WebApps -> "WebApps"
  NotFound -> "NotFound"
  Links -> "Links"

pageToHash :: Pages -> String
pageToHash = case _ of
  About -> "about"
  Musics -> "musics"
  Pictures -> "pictures"
  WebApps -> "webapps"
  NotFound -> "notFound"
  Links -> "links"

hashToPage :: String -> Pages
hashToPage = case _ of
  "about" -> About
  "musics" -> Musics
  "pictures" -> Pictures
  "webapps" -> WebApps
  "links" -> Links
  "" -> About
  _ -> NotFound