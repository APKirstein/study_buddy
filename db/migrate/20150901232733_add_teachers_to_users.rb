class AddTeachersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teacher, :bool, default: false, null: false
  end
end
