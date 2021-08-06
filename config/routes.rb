Rails.application.routes.draw do
  root to: 'zingnews#index'
  # Category
  get 'category/:id/:name', to: 'zingnews#show_category', as: 'category'
  #Article
  get 'article/:id', to: 'zingnews#show_product', as: 'show_product'
  #Login
  get 'dang-nhap', to: 'user#login', as: 'login'
  post 'dang-nhap', to: 'user#check_user'
  #Signup
  get 'dang-ki', to: 'user#signup', as: 'signup'
  post 'dang-ki', to: 'user#create_user', as: 'new_user'
  get 'nguoi-dung/:id', to: 'user#show_user', as: 'show_user'
  post 'dang-xuat', to: 'user#logout', as: 'logout'
  #Search
  get 'tim-kiem', to: 'search#show_result', as: 'show_result'
  post 'search_items', to: 'search#search_items'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
