# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = Rails.application.credentials[:sentry_dsn]
  config.breadcrumbs_logger = %i[active_support_logger http_logger sentry_logger]

  config.send_default_pii = true
  config.traces_sample_rate = 1.0

  config.send_modules = false # if you don't want to send all the dependency info
end
