Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/check_session', to: 'sessions#check_session'
  delete '/logout', to: 'sessions#destroy'
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :skills, only: [:index, :show, :create]
  resources :subcategories, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
