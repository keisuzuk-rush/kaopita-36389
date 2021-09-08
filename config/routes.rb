Rails.application.routes.draw do
	devise_for :users
  get 'tweets/index'
  
  root to: "plans#index"

	resources :plans, only: :index
	resources :rooms, only: [:index, :new, :create]
end
