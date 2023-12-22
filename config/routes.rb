# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      post :search
    end
  end

  # devise_for :users do
  #   match '/legacy/sign_in', via: :get, as: :legacy_sign_in, to: 'legacy/sessions#new'
  #   match '/legacy/sign_in',      via: :post,   as: :user_session,        to: 'legacy/sessions#create'
  #   match '/sign_out',            via: :delete, as: :sign_out,            to: 'devise/sessions#destroy'
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # match '/api/internal/sign_in', via: :post, as: :internal_api_sign_in, to: 'api/internal/sign_in#create'

  # devise_scope :user do
  #   # standard:disable Layout/ExtraSpacing
  #   match '/legacy/sign_in',      via: :get,    as: :legacy_sign_in,      to: 'legacy/sessions#new'
  #   match '/legacy/sign_in',      via: :post,   as: :user_session,        to: 'legacy/sessions#create'
  #   match '/sign_out',            via: :delete, as: :sign_out,            to: 'devise/sessions#destroy'
  #   # standard:enable Layout/ExtraSpacing, Layout/LineLength
  # end

  # Defines the root path route ("/")
  # root "posts#index"
  root 'dashboard#index'
end
