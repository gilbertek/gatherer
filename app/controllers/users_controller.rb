# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_valid_user!

  def show
    @user = find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'You have successfully created an account. Please sign in to continue'
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def find_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
