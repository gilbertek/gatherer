# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def refund_notification
    OrderMailer.with(order).refund_notification
  end
end
