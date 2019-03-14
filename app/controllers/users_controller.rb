# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # yay
    else
      render :new
    end
  end

  private

  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
