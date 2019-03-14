# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :signups, path: 'signups', only: %i[new create]

  resources :users, only: %i[show new create] do
    resources :admins, only: %i[create destroy]
  end

  resources :orders, only: %i[show update new create] do
    resources :refunds, only: [:create]
  end

  resource :events, only: %i[new create destroy]
end
