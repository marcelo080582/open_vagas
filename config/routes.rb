Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :companies, only: %i[new edit update create]
  resources :positions
  resources :applicants, only: %i[index new create]

  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
