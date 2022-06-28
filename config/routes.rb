Rails.application.routes.draw do
  root "home#home"
  get "/users/:id", to: "users#show"
  devise_for :users, :path_prefix => 'd'
  resources :users
end
