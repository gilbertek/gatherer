# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: 'example@example.com'

  def refund_notification
    mail(subject: 'Order refunded')
  end
end
