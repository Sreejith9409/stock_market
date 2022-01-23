Sidekiq.configure_server do |config|
  config.redis = {
    url: Rails.application.credentials.dig(:redis, :url),
    password: Rails.application.credentials.dig(:redis, :password)
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: Rails.application.credentials.dig(:redis, :url),
    password: Rails.application.credentials.dig(:redis, :password)
  }
end
