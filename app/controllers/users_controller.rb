# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = find_user
  end

  private

  def find_user
    User.find(params[:id])
  end
end
