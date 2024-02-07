# frozen_string_literal: true

require 'logstash-logger'

Rails.application.configure do
  outputs = [{ type: :file, path: 'log/server.log', sync: true }]

  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Logstash.new
  config.lograge.logger = LogStashLogger.new(type: :multi_logger, outputs:)

  config.lograge.custom_payload do |controller|
    tracking_transaction_name = controller.instance_variable_get(:@graphql_operation_name).presence ||
                                controller.instance_variable_get(:@tracking_transaction_name).presence ||
                                controller.action_name

    controller_method = "#{controller.class.name}##{tracking_transaction_name}"
    {
      host: "#{Rails.env} (#{`hostname`.chomp})",
      log_type: Rails.env,
      request_time: Time.current,
      params: controller.request.params.except(:controller, :action).to_s,
      response: controller.response.try(:body),
      user_ip: controller.request.remote_ip,
      controller_method:,
      tracking_transaction_name:,
      user_agent: controller.request.user_agent
    }
  end
end
