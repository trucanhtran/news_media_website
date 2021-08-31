class AddUserIdToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categoriess, :user, index: true
  end
end
