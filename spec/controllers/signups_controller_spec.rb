# frozen_string_literal: true

require 'rails_helper'

describe SignupsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get new_signup_path
      expect(response).to have_http_status(:success)
    end
  end
end
