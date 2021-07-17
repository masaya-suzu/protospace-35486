Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  get 'messages/index'
  root to: "prototypes#index"
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :show]
  end
  resources :users, only: [:show]
end
