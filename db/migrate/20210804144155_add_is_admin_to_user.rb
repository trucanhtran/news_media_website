class AddIsAdminToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean, default: false, index: true
  end
end
