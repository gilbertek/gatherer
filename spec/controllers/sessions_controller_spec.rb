# frozen_string_literal: true

require 'rails_helper'

describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get logout_path
      expect(response).to have_http_status(:success)
    end
  end
end
