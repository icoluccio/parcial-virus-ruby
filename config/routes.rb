# frozen_string_literal: true

Rails.application.routes.draw do
  resources :computadoras do
    member do
      get :instalar
      get :ejecutar
      get :frenar
    end
  end

  namespace :admin do
    resources :computadoras
    resources :programas
    resources :logs

    root to: 'computadoras#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
