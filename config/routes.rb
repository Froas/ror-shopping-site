Rails.application.routes.draw do

  get "/user/:id", to: "users#show"
  get "/users", to: "users#index"
  get "/user/delete/:id", to: "users#destroy", as: :user_delete_path
  post "create_good", to: "goods#create"
  post "create_staff", to: "staffs#create"
  get "/goods", to: "goods#index"
  get "delete_good/:id", to: "goods#destroy", as: :delete_good_path
  get "/staffs", to: "staffs#index"
  get "/admin", to: "staffs#admin"
  get "/create", to: "staffs#new"
  get "delete_staff/:id", to: "staffs#destroy", as: :delete_staff_path

 
  namespace :users do
    get 'dashboard/index'
  end
  namespace :staffs do
    get 'dashboard/index'
  end

  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :staffs, path: 'staffs', controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations'
  }

  devise_scope :user do
    authenticated :user do
      namespace :users do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  devise_scope :staff do
    authenticated :staff do
      namespace :staffs do
        get 'dashboard/index', as: :authenticated_root
      end
    end
  end

  root "home#home"
  resources :users, only: [:edit, :update, :show]
  resources :goods
  resources :staffs
end
