class AddTypeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :type, index: true
  end
end
