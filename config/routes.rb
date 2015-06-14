Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :users, only: [:new, :create, :show]
  resources :ideas, only: [:new, :create, :show, :destroy, :edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
