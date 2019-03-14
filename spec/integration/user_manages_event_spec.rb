# frozen_string_literal: true

require 'rails_helper'

feature 'Event management' do
  scenario 'create event' do
    visit new_event_path

    fill_in :event_title, with: 'A Refactoring Meetup'
    fill_in :event_description, with: 'Fun for the whole team(lol, jk)'
    click_button 'Create Event'

    expect(page).to(
      have_css('ul.event-attributes', text: 'A Refactoring Meetup')
    )
  end

  scenario 'cancels event' do
    visit new_event_path

    fill_in :event_title, with: 'Doomed'
    fill_in :event_description, with: 'Not gonnna happen'
    click_button 'Create Event'

    click_button 'Cancel Event'

    expect(page).to(
      have_css('ul.event-attributes', text: 'Status: Canceled')
    )
  end
end
