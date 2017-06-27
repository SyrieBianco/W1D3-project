Links::Application.routes.draw do
  resources :users, only: [:new, :create,]
  resources :links
  resources :comments, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]

end
