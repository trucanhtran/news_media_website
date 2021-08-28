class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :products, dependent: :destroy
  has_many :users, through: :products
end
