# frozen_string_literal: true

class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
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

  def order_params
    params.permit(:refunded)
  end
end
