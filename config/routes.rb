# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :session, only: [:create], path: :log_in, as: :log_in

      resources :products, only: [:index]
      resources :vendors, only: [] do
        resources :products, only: %i[index destroy], controller: :'vendors/products'
      end
    end
  end
end
