class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :rut, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
  end
end
