class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :comments
  has_many :categories, through: :products
  validates :email, presence: true

  scope :survey_users_by_date, ->(sort_date){
    left_joins(:products)
    .select('users.id, users.name, users.email, count(products.id) as total_products')
    .group(:id)
    .order("users.updated_at #{sort_date}")
  }

  scope :survey_users_by_quatity, ->(sort_by_quantity){
    left_joins(:products)
    .select('users.id, users.name, users.email, count(products.id) as total_products')
    .group(:id)
    .order("count(users.id) #{sort_by_quantity}")
  }

  scope :survey_users_by_type, ->(sort_by_type){
    left_joins(:products)
    .select('users.id, users.name, users.email, count(products.id) as total_products')
    .where(is_admin: "#{sort_by_type}")
    .group(:id)
    .order('users.id asc')
  }
end
