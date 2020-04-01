Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get '/users', to: 'users#index'
  resources :users do
    resources :artworks, only: :index
  end

  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'


  resources :artworks, except: [:new, :edit]

  resources :artwork_shares, only: [:create, :destroy]

end





