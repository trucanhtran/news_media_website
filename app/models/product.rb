class Product < ApplicationRecord
  extend FriendlyId
  has_rich_text :content
  friendly_id :title, use: :slugged

  max_paginates_per 30

  belongs_to :category
  belongs_to :user
end
