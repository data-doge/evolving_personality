class AddTypeToRecord < ActiveRecord::Migration
  def change
    add_reference :records, :type, index: true
  end
end
