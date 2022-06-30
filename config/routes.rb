Rails.application.routes.draw do
  root "home#home"
  get "/user/:id", to: "users#show"
  get "/users", to: "users#index"
  get "/user/delete/:id", to: "users#destroy", as: :user_delete_path
  post "create_good", to: "goods#create"
  get "/goods", to: "goods#index"
  get "/admin", to: "users#admin"
  get "set_admin", to: "users#admin_set", as: :set_admin_path
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:edit, :update, :show]
  resources :goods
end
