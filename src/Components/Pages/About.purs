module YukiPortfolio.Components.Pages.About where

import Prelude
import Halogen as H
import Halogen.HTML as HH
import Halogen.Hooks as Hooks
import Halogen.HTML.Properties as HP
import YukiPortfolio.Components.Common (css)

component :: forall q i o m. H.Component q i o m
component = Hooks.component \_ _ -> Hooks.pure $
  HH.div [css "relative animate-fade-in-quick mt-3 text-center"]
  [ HH.img [css "rounded-full mx-auto block w-20 h-20", HP.src "./images/yuki_icon1.png", HP.width 80, HP.height 80]
  , HH.p [css "block text-2xl my-2.5 font-bold sm:width-full"] [HH.text "ゆきくらげ / Yukikurage"]
  , HH.div [css "max-w-4xl min-w-min mx-auto pt-3 flex flex-wrap justify-around w-full sm:w-auto gap-3"]
    [ mkAbout "音楽" "生音と電子音を組み合わせた曲をよく作っています．主な活動場所はSoundCloudですが，Youtube, ニコニコ動画にも上げています．"
    , mkAbout "絵" "時々描いてます．描いた絵は主にPixivにアップロードしています．"
    , mkAbout "プログラミング関連" "HaskellやPureScriptを触っています．\nAtCoder 緑．"
    , mkAbout "このサイトについて" "僕の作ったものや関わったものをまとめるサイトです．PureScriptで作っています． "
    ]
  ]

mkAbout :: forall w i. String -> String -> HH.HTML w i
mkAbout title description =
  HH.div [css "my-1.5 w-full sm:w-80 h-auto text-center"]
  [ HH.p [css "block text-lg my-1.5 font-bold"] [HH.text title]
  , HH.p [css "text-left"] [HH.text description]
  ]