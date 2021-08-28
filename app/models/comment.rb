class Comment < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
