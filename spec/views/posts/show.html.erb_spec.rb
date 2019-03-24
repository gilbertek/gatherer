# frozen_string_literal: true

require 'rails_helper'

describe 'posts/show', type: :view do
  context 'when the user is an admin' do
    it 'renders a delete link' do
      assign(:post, build_stubbed(:post))
      sign_in_as(build_stubbed(:admin))

      render

      expect(rendered).to include 'Delete this post'
    end
  end

  context 'when the user is not an admin' do
    it 'does renders a delete link' do
      assign(:post, build_stubbed(:post))
      sign_in_as(build_stubbed(:user))

      render

      expect(rendered).not_to include 'Delete this post'
    end
  end
end
