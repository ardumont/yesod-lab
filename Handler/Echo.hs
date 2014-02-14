module Handler.Echo where

import Import

getEchoR :: Text -> Handler Html
getEchoR txt = defaultLayout [whamlet|<h1>#{txt}|]
