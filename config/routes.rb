Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :home, only: :index
  root 'home#index'

  resource :profile, only: [:show]

  resources :posts, only: [:new, :create] do
    resource :likes, only: %i[create destroy]
  end
end
