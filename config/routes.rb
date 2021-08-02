Rails.application.routes.draw do
  root to: 'zingnews#index'
  # Category
  get ':id/:name', to: 'zingnews#show_category', as: 'category'
  #Article
  get ':id', to: 'zingnews#show_product', as: 'show_product'
  #Login
  get 'dang-ki', to: 'user#login', as: 'login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
