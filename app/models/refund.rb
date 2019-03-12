# frozen_string_literal: true

class Refund
  def initialize(order:)
    @order = order
  end

  def run!
    @order.update!(refunded: true)
    OrderMailer.with(order: @order).refund_notification.deliver_now
  end
end
