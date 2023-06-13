Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :categories
  resources :books
  get '/create-categories', to: 'categories#new'
  post '/create-categories', to: 'categories#create'
  get '/create-books', to: 'books#new'
  post '/create-books', to: 'books#create'
  get '/category', to: 'categories#show'
  get '/toggle_status/:id', to: 'categories#toggle_status', as: 'toggle_status'
  get '/category-destroy/:id', to: 'categories#destroy', as:'category_destroy'
  get '/category-edit/:id', to: 'categories#edit', as:'category_edit'


  get '/login', to: 'session#new' 
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'session#destroy'

end
