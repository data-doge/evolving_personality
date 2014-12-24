class AddDefaultValueToBinaryStringInUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :binary_string, "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  end
end
