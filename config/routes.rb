Rails.application.routes.draw do
  devise_for :users

  root 'salesforce/accounts#index'

  namespace :salesforce do
    resources :accounts, only: [:index, :show, :new, :create]
  end
end
