Rails.application.routes.draw do
  devise_for :users

  namespace :salesforce do
    resources :accounts, only: [:index]
  end
end
