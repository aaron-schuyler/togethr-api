Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/check_session', to: 'sessions#check_session'
  delete '/logout', to: 'sessions#destroy'
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  post '/tickets/:id/submit', to: 'tickets#submit'
  post '/tickets/:id/accept', to: 'tickets#accept'
  post '/tickets/:id/reject', to: 'tickets#reject'
  post '/tickets/:id/conditionally_accept', to: 'tickets#conditionally_accept'
  post '/tickets/:id/approve', to: 'tickets#approve'
  post '/tickets/:id/close', to: 'tickets#close'
  resources :skills, only: [:index, :show, :create]
  resources :subcategories, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
