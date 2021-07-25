class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text :title
      t.text :description
      t.text :content
      t.boolean :hot_new
      t.belongs_to :category

      t.timestamps
    end
  end
end
