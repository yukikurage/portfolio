module YukiPortfolio.Styles.ErrorMessage where


import CSS (CSS, byClass, star, (&), (?))
import CSS.TextAlign as TextAlign

style :: CSS
style = do
  star & byClass "errorMessage" ? do
    TextAlign.textAlign TextAlign.center