# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SUPPORT_EMAIL', 'support@awesome.com')
  layout 'mailer'
end
