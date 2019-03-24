# frozen_string_literal: true

require 'rails_helper'

describe DashboardController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
