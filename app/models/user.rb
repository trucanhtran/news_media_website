class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :comments
  has_many :categories, through: :products
  validates :email, presence: true
end
