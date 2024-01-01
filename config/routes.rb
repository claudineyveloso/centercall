# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '*path', to: 'pages#home', via: :all
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, defaults: { format: :json }, path: '', path_names: {
                                                                  sign_in: 'login',
                                                                  sign_out: 'logout',
                                                                  registration: 'signup'
                                                                },
                         controllers: {
                           sessions: 'api/v1/users/sessions',
                           registrations: 'api/v1/users/registrations'
                         }
    end
  end

  # Defines the root path route ("/")
  # devise_for :users, path: '', path_names: {
  #                                sign_in: 'login',
  #                                sign_out: 'logout',
  #                                registration: 'signup'
  #                              },
  #                    controllers: {
  #                      sessions: 'users/sessions',
  #                      registrations: 'users/registrations'
  #                    }

  root 'pages#home'
end
