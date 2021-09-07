Rails.application.routes.draw do
  get 'tweets/index'
  devise_for :users
  root to: "plans#index"

	resources :plans, only: :index
	resources :rooms, only: [:new, :create]
end
