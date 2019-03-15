# frozen_string_literal: true

require 'rails_helper'

feature 'Event management' do
  scenario 'create event' do
    event_on_page = Page::Event.new(title: 'abc123', description: 'description')
    event_on_page.create

    expect(event_on_page).to exist?
  end

  scenario 'cancels event' do
    event_on_page = Page::Event.new(title: 'title', description: 'description')
    event_on_page.create

    event_on_page.cancel

    expect(event_on_page).to canceled
  end
end
