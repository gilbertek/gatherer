# frozen_string_literal: true

class DashboardController < ApplicationController
  skip_before_action :require_valid_user!

  def show; end
end
