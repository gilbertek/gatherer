# frozen_string_literal: true

class Refund
  def initialize(order: order)
    @order = order
  end

  def run!
    OrderMailer.refund_notification(order).deliver
  end
end
