# frozen_string_literal: true

require 'rails_helper'

feature 'A user signs up' do
  scenario 'and creates a team at the same time' do
    visit new_signup_path

    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Team name', with: 'Team name'
    submit_form

    # expect(User.count).to eq 1
    # expect(Team.count).to eq 1
    # expect(page).to have_text("Team name can't be blank")
  end

  # scenario 'see errors if they omit required fields' do
  #   visit new_user_path
  #
  #   submit_form
  #
  #   expect(User.count).to eq 0
  #   expect(page).to have_text("Email can't be blank")
  #   expect(page).to have_text("Password can't be blank")
  # end

  def submit_form
    click_button 'submit'
  end
end
