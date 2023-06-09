Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :categories
  get '/create-categories', to: 'categories#new'
  post '/create-categories', to: 'categories#create'

  get '/login', to: 'session#new' 
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
