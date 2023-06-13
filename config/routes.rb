Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :categories
  resources :books
  resources :evaluaters

  get '/create-categories', to: 'categories#new'
  post '/create-categories', to: 'categories#create'

  get '/create-books', to: 'books#new'
  post '/create-books', to: 'books#create'

  get '/books-destroy/:id', to: 'books#destroy', as:'books_destroy'
  get '/books-edit/:id', to: 'books#edit', as:'books_edit'

  get '/category', to: 'categories#show'
  get '/toggle_status/:id', to: 'categories#toggle_status', as: 'toggle_status'

  get '/toggle_status_book/:id', to: 'books#toggle_status_book', as: 'toggle_status_book'


  get '/category-destroy/:id', to: 'categories#destroy', as:'category_destroy'
  get '/category-edit/:id', to: 'categories#edit', as:'category_edit'


  get '/login', to: 'session#new' 
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'session#destroy'

end
