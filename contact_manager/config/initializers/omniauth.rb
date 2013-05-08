Rails.application.config.middleware.use OmniAuth::Builder do
  # provider NAME, #consumer_key, #consumer_secret
  provider :twitter, "MQfS4XAJXYE3SxTna6Yzrw", "uXZ4VHykCrYKP64wSQ72SRM10WZwirnXq5rmyiLnVk"
end