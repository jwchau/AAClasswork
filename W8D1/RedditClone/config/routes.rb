Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  
  resources :subs do
    # resources :posts, only:[:create]
  end 

  resources :posts #, except: [:create]

  resource :session
end
