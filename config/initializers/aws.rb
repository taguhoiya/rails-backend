# frozen_string_literal: true

# Aws::Rails.add_action_mailer_delivery_method(
#   :ses,
#   credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key_id],
#                                     Rails.application.credentials.aws[:secret_access_key]),
#   region: 'us-west-1'
# ) # オレゴン

creds = Aws::Credentials.new(
  Rails.application.credentials.aws[:access_key_id],
  Rails.application.credentials.aws[:secret_access_key]
)
Aws::Rails.add_action_mailer_delivery_method(:aws_sdk, credentials: creds, region: 'ap-northeast-1')
