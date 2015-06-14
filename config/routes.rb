Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :users, only: [:new, :create, :show]
  resources :ideas, only: [:new, :create, :show, :destroy, :edit, :update]

  namespace :admin do
    resources :categories, only: [:index]
  end


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
