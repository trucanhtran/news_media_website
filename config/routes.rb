Rails.application.routes.draw do
  namespace :admin do
    get 'dash_board', to: 'dash_board#index'
    #Admin
    get 'new_admin', to: 'manage_user#new_admin'
    get 'show_admins', to: 'manage_user#show_admins'
    post 'new_admin', to: 'manage_user#create_admin'
    get 'edit_admin/:id', to: 'manage_user#edit_admin', as: 'edit'
    patch 'update_admin/:id', to: 'manage_user#update_admin', as: 'update'
    delete 'delete_admin/:id', to: 'manage_user#delete_admin', as: 'delete'
    post 'search_user_type', to: 'manage_user#search_user_type'
    post 'sort_by_date', to: 'manage_user#sort_by_date'
    post 'sort_by_quantity', to: 'manage_user#sort_by_quantity'
    get ':id/articles', to: 'manage_user#show_articles', as: 'show_articles'
    #Article
    get 'articles', to: 'manage_article#show_articles'
    get 'new_article', to: 'manage_article#new_article'
    post 'new_article', to: 'manage_article#create_article'
    delete 'delete_article/:id', to: 'manage_article#delete_article', as: 'delete_article'
    get 'edit_article/:id', to: 'manage_article#edit_article', as: 'edit_article'
    patch 'update_article/:id', to: 'manage_article#update_article', as: 'update_article'
    post 'articles/sort_by_date', to: 'manage_article#sort_by_date'
    #Category
    get 'categories', to: 'manage_category#show_categories'
    #Show articles
    get 'category/:id/articles', to: 'manage_category#show_articles', as: 'category_articles'

  end
  namespace :api do
    #User
    get 'users', to: 'user#index'
    get 'user/:id', to: 'user#show'
    post 'users', to: 'user#create'
    delete 'user/:id', to: 'user#delete'
    put 'user/:id', to: 'user#update'
    #Article
    get 'articles', to: 'article#index'
    get 'article/:id', to: 'article#show'
    post 'articles', to: 'article#create'
    delete 'article/:id', to: 'article#delete'
    put 'article/:id', to: 'article#update'
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
  #Search
  get 'tim-kiem', to: 'search#show_result', as: 'show_result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
