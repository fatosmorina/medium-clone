Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#show'
  resources :posts
  resources :users, only: [:show, :edit, :update]
  resource :relationships, only: [:create, :destroy]

end
