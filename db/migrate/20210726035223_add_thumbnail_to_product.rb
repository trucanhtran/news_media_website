class AddThumbnailToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :thumbnail, :string
  end
end
