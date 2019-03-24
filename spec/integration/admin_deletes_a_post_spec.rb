# frozen_string_literal: true

require 'rails_helper'

feature 'Post deletion' do
  scenario 'admins can delete a post' do
    user = create(:user)
    post_by_user = create(:post, user: user)
    admin = create(:user, admin: true)

    sign_in_as(admin)

    visit post_path(post_by_user)
    click_link 'Delete this post'

    expect(page).to have_text('Post deleted')
  end

  scenario 'normal users can\'t delete their posts' do
    user = create(:user)
    post_by_user = create(:post, user: user)

    sign_in_as(user)
    visit post_path(post_by_user)

    expect(page).not_to have_css('a', text: 'Delete this post')
  end

  def sign_in_as(user)
    visit login_path
    fill_in :session_email, with: user.email
    fill_in :session_password, with: user.password
    click_button 'Log In'
  end
end
