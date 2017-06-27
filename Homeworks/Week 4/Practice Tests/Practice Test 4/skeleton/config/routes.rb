Links::Application.routes.draw do

resources :users, only: [:new, :create]
resources :comments, only: [:create, :destroy]
resources :links

resource :session, only: [:new, :create, :destroy]

end
