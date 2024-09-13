Rails.application.routes.draw do
  # get 'books/new'
  root to: 'homes#top'
  # get '/' =>'homes#top'
  get 'start' =>'books#books'
  post 'books' => 'books#create'   #9/12追記
  # get 'books/index'
  get 'books/show'
  get 'books/edit'
  get '/books' => 'books#books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
