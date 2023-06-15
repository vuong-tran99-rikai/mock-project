Rails.application.routes.draw do
  root 'pages#home'
  resources :users
  resources :categories
  resources :books
  resources :evaluaters
  resources :discounts
  resources :discount_details

  get '/create-categories', to: 'categories#new'
  post '/create-categories', to: 'categories#create'

  get '/create-books', to: 'books#new'
  post '/create-books', to: 'books#create'

  get '/create-evaluater/:id', to: 'evaluaters#new' ,as: "create_evaluaters"
  post '/create-evaluater', to: 'evaluaters#create'

  get '/books-destroy/:id', to: 'books#destroy', as: 'books_destroy'
  get '/books-edit/:id', to: 'books#edit', as: 'books_edit'

  get '/category', to: 'categories#show'
  get '/toggle_status/:id', to: 'categories#toggle_status', as: 'toggle_status'

  get '/toggle_status_book/:id', to: 'books#toggle_status_book', as: 'toggle_status_book'


  get '/category-destroy/:id', to: 'categories#destroy', as: 'category_destroy'
  get '/category-edit/:id', to: 'categories#edit', as: 'category_edit'

  get '/create-discounts', to: 'discounts#new'
  get '/create-discounts', to: 'discounts#create'
  get '/discount', to: 'discounts#show'

  get '/toggle_status_discount/:id', to: 'discounts#toggle_status', as: 'toggle_status_discount'
  get '/discount-destroy/:id', to: 'discounts#destroy', as: 'discount_destroy'
  get '/discount-edit/:id', to: 'discounts#edit', as:'discount_edit'
  

  get 'add-discount', to: 'discount_details#new'
  get 'add-discount', to: 'discount_details#create'
  get '/discount-detail-seen/:id', to: 'discount_details#edit', as:'discount_detail_seen'
  get '/discount-detail-destroy/:id', to: 'discount_details#destroy', as:'discount_detail_destroy'



  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/signup', to: 'users#new'
  get '/logout', to: 'session#destroy'
  get '/convert_status/:id', to: 'users#convert_status', as: 'convert_status'

  get '/detail/:id', to: 'pages#show', as: 'detail'
  get '/add_item/:id', to: 'pages#add_item', as: 'add_item'
  get '/cart', to: 'pages#cart'
end
