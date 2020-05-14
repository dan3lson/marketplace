# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'

      resources :products, only: [:index]
      resources :vendors, only: [] do
        resources :products, only: %i[index destroy], controller: :'vendors/products'
      end
    end
  end
end
