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

    end
  end

  def create
    @order = build_order
    @order.user = current_user

    if OrderCreator.new(order: @order).save
    # if @order.save
      redirect_to @order
    else
      render "new"
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
