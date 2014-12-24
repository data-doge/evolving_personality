class AddBinaryStringToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :binary_string, :string
  end
end
