Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :login, only: [:create]
  end
end
