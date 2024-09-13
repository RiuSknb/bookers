Rails.application.routes.draw do

  # 最初に表示するページの設定
  root to: 'homes#top'

  # resources :books
  post 'books' => 'books#create'
  get 'show' => 'books#show'
  get 'books/:id/edit' => 'books#edit', as:'edit_book'
  get 'books/:id' => 'books#show', as: 'book'
  patch 'books/:id' =>'books#update', as:'update_book'
  get '/books' => 'books#index'
  delete 'books/:id' =>'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
