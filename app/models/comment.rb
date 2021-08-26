class Comment < ApplicationRecord
  belongs_to :product, presence: true
  belongs_to :user, presence: true
end
