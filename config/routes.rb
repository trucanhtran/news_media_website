Rails.application.routes.draw do
  root to: 'zingnews#index'
  # Category
  get ':id/:name', to: 'zingnews#show_category', as: 'category'
  #Article
  get ':id', to: 'zingnews#show_product', as: 'show_product'
  #Search
  post 'tim-kiem', to: 'zingnews#search', as: 'search'
  get 'show_items', to: 'search_items#show_result', as: 'show_result'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
