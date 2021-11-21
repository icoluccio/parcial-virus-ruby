Rails.application.routes.draw do
  resources :computadoras

  namespace :admin do
      resources :computadoras

      root to: "computadoras#index"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
