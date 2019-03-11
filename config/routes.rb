# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :admins, only: %i[create destroy]
  end

  resources :orders, only: %i[show update] do
    resources :refunds, only: [:create]
  end
end
