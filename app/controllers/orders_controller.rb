# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  class OrderCreator
    def initialize(order: order)
      @order = order
    end

    def save
      OrderMailer.with(order: order).confirmation.deliver_now if order.save
    end
  end

  def create
    @order = build_order
    @order.user = current_user

    # if OrderCreator.new(order: @order).save
    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was updated'
    else
      render :edit
    end
  end

  def edit; end

  private

  class ConfirmingOrder < SimpleDelegator
    def save
      OrderMailer.with(order: self).confirmation.deliver_now if __getobj__.save
    end
  end

  def build_order
    ConfirmingOrder.new(
      Order.new(order_params)
    )
  end

  def order_params
    params.permit(:refunded)
  end
end
