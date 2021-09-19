Rails.application.routes.draw do
  get 'blog/index'
	devise_for :users
  get 'tweets/index'
  
  root to: "plans#index"

	resources :plans, only: :index
	resources :rooms, only: [:index, :new, :create, :destroy] do
		resources :tweets, only: [:index, :create]
	end
	resources :faces, only: :index
	resources :blogs
end
