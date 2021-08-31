class Product < ApplicationRecord
  extend FriendlyId
  has_rich_text :content
  friendly_id :title, use: :slugged

  paginates_per 50

  belongs_to :category
  belongs_to :user
  has_many :comments
end
