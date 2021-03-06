# frozen_string_literal: true

class SignupsController < ApplicationController
  skip_before_action :require_valid_user!

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(user_params)

    if @signup.save
      # yay
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:signup).permit(:email, :team_name)
  end
end
