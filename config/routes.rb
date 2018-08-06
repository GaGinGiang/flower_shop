Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root to: "flowers#index"
    get "/product", to: "static_pages#product"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    post "/signup",  to: "users#create"
    get "users/new"
    get "flowers/new"
    # get "flowers/index"
    get "supplier/index"
    resources :users
    resources :flowers
    resources :categories
    resources :suppliers
  end
end
