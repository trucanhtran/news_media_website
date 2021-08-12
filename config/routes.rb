Rails.application.routes.draw do
  namespace :admin do
    get 'dash_board', to: 'dash_board#index'
    #Admin
    get 'new_admin', to: 'manage_user#new_admin'
    get 'show_admins', to: 'manage_user#show_admins'
    post 'new_admin', to: 'manage_user#create_admin'
    get 'edit_admin/:id', to: 'manage_user#edit_admin', as: 'edit'
    patch 'update_admin/:id', to: 'manage_user#update_admin', as: 'update'
    delete 'delete_admin/:id', to: 'dash_board#delete_admin', as: 'delete'
    #Article
    get 'articles', to: 'manage_article#show_articles'
    get 'new_article', to: 'manage_article#new_article'
    post 'new_article', to: 'manage_article#create_article'
    delete 'delete_article/:id', to: 'manage_article#delete_article', as: 'delete_article'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
