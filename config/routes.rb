Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/check_session', to: 'sessions#check_session'
  delete '/logout', to: 'sessions#destroy'
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  get '/requests', to: 'requests#index'
  patch '/tickets/:id/submit', to: 'tickets#submit'
  patch '/requests/:id/accept', to: 'requests#accept'
  patch '/requests/:id/reject', to: 'requests#reject'
  patch '/tickets/:id/conditionally_accept', to: 'tickets#conditionally_accept'
  patch '/tickets/:id/approve', to: 'tickets#approve'
  patch '/tickets/:id/close', to: 'tickets#close'
  resources :skills, only: [:index, :show, :create]
  resources :subcategories, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  patch '/users/:id/add_skills', to: 'users#add_skills'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
