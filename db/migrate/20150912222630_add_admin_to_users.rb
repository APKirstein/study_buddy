class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :bool, default: false, null: false
  end
end
