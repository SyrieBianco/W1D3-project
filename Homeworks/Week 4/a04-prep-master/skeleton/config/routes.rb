Links::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :links, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :comments, only: [:create, :destroy]
end
