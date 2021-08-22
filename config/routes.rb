Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :companies, only: %i[new edit update create]
  resources :positions do
    resources :applicants, only: :index
  end
  resources :applicants, only: %i[new create]

  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
