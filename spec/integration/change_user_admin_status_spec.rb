# frozen_string_literal: true

require 'rails_helper'

feature "Change user's admin status" do
  scenario 'promote to admin' do
    user = create(:user)

    visit user_path(user)
    click_button 'Promote to admin'

    expect(page).to have_text('User is an admin')
  end

  scenario 'demote from admin' do
    user = create(:user, admin: true)

    visit user_path(user)
    click_button 'Demote'

    expect(page).to have_text('User is not an admin')
  end
end
