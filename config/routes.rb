Rails.application.routes.draw do
  get 'tweets/index'
  devise_for :users
  #root to: "plans#index"
	root to: "tweets#index"

	resources :plans, only: :index
end
