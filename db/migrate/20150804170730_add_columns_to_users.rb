class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :year, :integer, null: false
  end
end
