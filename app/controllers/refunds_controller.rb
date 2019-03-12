# frozen_string_literal: true

class RefundsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    Refund.new(order: @order).run!

    redirect_to @order
  end
end
