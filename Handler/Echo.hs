module Handler.Echo where

import Import

getEchoR :: String -> Handler Html
getEchoR txt = defaultLayout [whamlet|<h1>#{txt}|]
