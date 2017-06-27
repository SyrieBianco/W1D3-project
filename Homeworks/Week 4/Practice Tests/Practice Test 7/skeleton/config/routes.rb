Links::Application.routes.draw do
resources :links
resources :comments, only: [:new, :create, :destroy]
resources :users, only: [:new, :create, :destroy]
resource :session, only: [:new, :create, :destroy]

end
