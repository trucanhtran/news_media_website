class Product < ApplicationRecord
  extend FriendlyId
  has_rich_text :content
  friendly_id :title, use: :slugged

  paginates_per 50

  belongs_to :category
  belongs_to :user
  has_many :comments

  scope :survey_products, -> {
    joins(:user, :category)
    .select('products.id, products.title, categories.name as category_name, users.name as user_name')
    .order("products.updated_at desc")
  }

  scope :survey_products_by_date, -> (sort_date = 'desc'){
    left_joins(:user,:category)
    .select('products.id, products.title,products.hot_new, categories.name as category_name, users.name as user_name')
    .order("products.updated_at #{sort_date}")
  }
end
