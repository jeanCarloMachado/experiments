{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

main = scotty 3000 $ do
  get "/schduler" $ do
    json [(0::Int)..10]
  delete "/" $ do
    text "deleted!"

  post "/" $ do
    text "posted!"

  put "/" $ do
    text "put-ted!"

  matchAny "/all" $ do
    text "matches all methods"

  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]

  notFound $ do
    text "there is no such route."
