class User < ApplicationRecord
  has_secure_password
  has_many :products
  validates :email, presence: true
end
