module YukiPortfolio.Parts.Footer where
{-
import Prelude

import Data.Array (catMaybes)
import Data.Maybe (Maybe)
import Halogen.HTML as HH
import YukiPortfolio.Parts.MusicPlayer (musicPlayer)
import YukiPortfolio.Types.Contents.Music (Music)

footer :: forall w i. Maybe Music -> HH.HTML w i
footer (maybeMusic) =
  HH.footer_ $ catMaybes
  [
    musicPlayer <$> maybeMusic
  ]
-}