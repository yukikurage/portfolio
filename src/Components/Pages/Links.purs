module YukiPortfolio.Components.Pages.Links where

import Prelude hiding (div)

import Halogen as H
import Halogen.HTML (div)
import Halogen.HTML as HH
import Halogen.HTML.Properties (href, rel, target)
import Halogen.Hooks as Hooks
import YukiPortfolio.Components.Common (css)

component :: forall q i o m. H.Component q i o m
component = Hooks.component \_ _ -> Hooks.do
  Hooks.pure $ div [css "grid grid-cols-1 sm:grid-cols-2 mx-auto gap-5 max-w-3xl animate-fade-in-quick"]
    [ linkBox "fab fa-twitter" "bg-twitter" "https://twitter.com/yukikurage_2019" "Twitter" "駄文"
    , linkBox "fab fa-soundcloud" "bg-soundcloud" "https://soundcloud.com/yukikurage" "SoundCloud" "曲をあげてます"
    , linkBox {-"fab fa-youtube"-} "" "bg-youtube" "https://www.youtube.com/channel/UCTGwIwjCRMpe7cmpP2EaH3w" "Youtube" "曲を動画化して上げてます．曲以外もなにかしたい"
    , linkBox "fab fa-github" "bg-github" "https://github.com/yukikurage" "GitHub" "色々してます"
    , linkBox "" "bg-hatena" "https://yukikurage.hatenablog.com/" "はてなブログ" "駄文2"
    , linkBox "" "bg-yukiBlack" "https://www.nicovideo.jp/user/91678779" "ニコニコ動画" "一応使ってます"
    , linkBox "" "bg-pixiv" "https://www.pixiv.net/en/users/44737353" "Pixiv" "描いた絵をあげてます．ほぼ使ってない"
    ]

linkBox :: forall w i. String -> String -> String -> String -> String -> HH.HTML w i
linkBox icon col link title description = HH.a [css "grid grid-cols-link h-24 gap-1", href link, target "blank", rel "noopener"]
  [ HH.div [css $ "text-4xl bg-yukiBlack text-[white] flex justify-center items-center " <> col] [HH.i [css icon] []]
  , HH.div [css "flex flex-col justify-center items-center"]
    [ HH.p [css "text-lg font-bold text-center" ] [HH.text title]
    , HH.p [css "text-center"] [HH.text description]
    ]
  ]