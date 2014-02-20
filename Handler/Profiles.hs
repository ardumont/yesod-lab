module Handler.Profiles where

import Import

import Yesod.Form.Nic (YesodNic, nicHtmlField)
instance YesodNic App

postProfilesR :: Handler Html
postProfilesR = do
  mname <- runInputPost $ ireq textField "name"
  mcomment <- runInputPost $ ireq textField "comment"
  runDB $ insert $ Profile mname mcomment
  redirect $ HomeR
