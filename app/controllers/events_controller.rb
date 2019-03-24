# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_valid_user!, only: :destroy

  def new
    @event = Event.new
  end

  def create; end

  def destroy; end
end
