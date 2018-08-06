Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    get "/product", to: "static_pages#product"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "users/new"
    get "/signup", to: "users#new"
    post "/signup",  to: "users#create"
    get "sessions/new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "flowers/new"
    resources :users
    resources :flowers
  end
end
