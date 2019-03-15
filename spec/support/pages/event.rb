# frozen_string_literal: true

module Page
  class Event
    include Rails.application.routes.url_helpers
    include Capybara::DSL

    def initialize(title:, description:)
      @title = title
      @description = description
    end

    def create
      visit new_events_path
      fill_in :event_title, with: @title
      fill_in :event_description, with: @description
      click_button 'Create Event'
    end

    def cancel
      click_button 'Cancel Event'
    end

    def exist?
      event_attributes.has_text?(@title)
    end

    def canceled?
      event_attributes.has_text?('Status: Canceled')
    end

    private

    def event_attributes
      find('ul.event-attributes')
    end
  end
end
