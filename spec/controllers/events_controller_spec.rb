# frozen_string_literal: true

require 'rails_helper'

describe EventsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get new_events_path
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
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
