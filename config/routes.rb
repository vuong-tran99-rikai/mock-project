Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :categories
  resources :books
  get '/create-categories', to: 'categories#new'
  post '/create-categories', to: 'categories#create'
  get '/create-books', to: 'books#new'
  post '/create-books', to: 'books#create'

  get '/login', to: 'session#new' 
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new'

end
