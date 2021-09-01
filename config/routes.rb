Rails.application.routes.draw do
  root to: "plans#index"

	resources :plans, only: :index
end
