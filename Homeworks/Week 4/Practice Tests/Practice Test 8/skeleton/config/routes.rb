Links::Application.routes.draw do
resources :users, only: [:new, :create, :destroy]
resources :comments, only: [:new, :create, :destroy]
resources :links
resource :session, only: [:new, :create, :destroy]
end
