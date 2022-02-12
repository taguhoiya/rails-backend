# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@moview-ori.com'
  layout 'mailer'
end
