module YukiPortfolio.Components.Pages.About where


import Halogen.HTML as HH
import Halogen.HTML.Properties as HP
import YukiPortfolio.Components.Common (css)

about :: forall w i. HH.HTML w i
about = HH.div [css "about"]
  [ HH.img [css "yukiIcon", HP.src "./public/images/yuki_icon1.png", HP.width 80, HP.height 80]
  , HH.h2_ [HH.text "ゆきくらげ / Yukikurage"]
  , HH.div [css "mainContents"]
    [ mkAbout "音楽" "生音と電子音を組み合わせた曲をよく作っています．主な活動場所はSoundCloudですが，Youtube, ニコニコ動画にも上げています．"
    , mkAbout "絵" "時々描いてます．描いた絵は主にPixivにアップロードしています．"
    , mkAbout "プログラミング関連" "HaskellやPureScriptを触っています．\nAtCoder 緑．"
    , mkAbout "このサイトについて" "僕の作ったものや関わったものをまとめるサイトです．PureScriptで作っています． "
    ]
  ]

mkAbout :: forall w i. String -> String -> HH.HTML w i
mkAbout title description =
  HH.div [css "aboutPanel"]
  [ HH.h3_ [HH.text title]
  , HH.p_ [HH.text description]
  ]