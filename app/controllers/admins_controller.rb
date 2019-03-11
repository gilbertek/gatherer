# frozen_string_literal: true

class AdminsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.update!(admin: true)

    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.update!(admin: false)

    redirect_to @user
  end
end
