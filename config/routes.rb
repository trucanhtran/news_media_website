Rails.application.routes.draw do
  root to: 'zingnews#index'
  # Category
  get ':id/:name', to: 'zingnews#show_category', as: 'category'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
