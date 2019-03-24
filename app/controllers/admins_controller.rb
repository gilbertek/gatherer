# frozen_string_literal: true

class AdminsController < ApplicationController
  before_action :require_valid_user!, only: :new

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
