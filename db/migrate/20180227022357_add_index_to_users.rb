class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :username
    add_index :users, :email
  end
end
