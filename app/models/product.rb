class Product < ApplicationRecord
  extend FriendlyId
  has_rich_text :content
  friendly_id :title, use: :slugged

  belongs_to :category
  belongs_to :user
end
