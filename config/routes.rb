# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#show'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  resources :signups, path: 'signups', only: %i[new create]

  resources :users, only: %i[show new create] do
    resources :admins, only: %i[create destroy]
  end

  resources :orders, only: %i[show update new create] do
    resources :refunds, only: [:create]
  end

  resource :events, only: %i[new create destroy]
end
