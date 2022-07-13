Rails.application.routes.draw do
  get 'order_line_items/show'
  get 'order_line_items/new'
  get 'order_line_items/index'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'

  get 'carts/show'

  get "/user/:id", to: "users#show"
  get "/users", to: "users#index"
  get "/user/delete/:id", to: "users#destroy", as: :user_delete_path
  post "create_product", to: "products#create"
  get "/products", to: "products#index"
  get "delete_product/:id", to: "products#destroy", as: :delete_product_path
  post "create_staff", to: "staffs#create"
  get "/staffs", to: "staffs#index"
  get "/admin", to: "staffs#admin"
  get "/create", to: "staffs#new"
  get "delete_staff/:id", to: "staffs#destroy", as: :delete_staff_path
  get "delete/:id", to: "cart_items#destroy", as: :delete_path
  get "/my_orders", to: "orders#show"
  get "/user_order", to: "orders#show"
  get "/carts", to: "carts#show"
  get "/details", to: "orders#detail"
  get "/order_checkout", to: "order_items#buy_all"
  

 
  namespace :users do
    get 'root'
  end
  namespace :staffs do
    get 'staff'
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
        get 'root', as: :authenticated_root
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

  root "products#index"
  resources :users
  resources :products
  resources :staffs
  resources :order_items
  resources :carts
  resources :orders
  resources :cart_items
end
