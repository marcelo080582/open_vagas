Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :companies, only: %i[new edit update create]
  resources :positions
  resources :applicants, only: %i[index new create]
end
