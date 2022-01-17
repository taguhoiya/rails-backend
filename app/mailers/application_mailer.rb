# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@moview-ori.com'
  layout 'mailer'
end
