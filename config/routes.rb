Rails.application.routes.draw do



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'welcome#index'

  resources :posts
  resources :users


end
