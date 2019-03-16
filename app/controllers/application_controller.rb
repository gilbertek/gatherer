# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_valid_user!

  def current_user
    @user ||= User.find(session[:user_id]) unless session[:user_id].blank?
  end

  def require_valid_user!
    unless current_user.present?
      flash[:error] = 'You must be logged in to access that page!'
      redirect_to login_path
    end
  end
end
