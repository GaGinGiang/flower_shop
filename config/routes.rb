Rails.application.routes.draw do
  get "flowers/new"
  # get "flowers/index"
  get "supplier/index"
  scope "(:locale)", locale: /en|vi/ do
    root to: "flowers#index"
    get "/product", to: "static_pages#product"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    resources :flowers
    resources :categories
    resources :suppliers
  end
end
