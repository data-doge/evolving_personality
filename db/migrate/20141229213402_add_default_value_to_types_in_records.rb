class AddDefaultValueToTypesInRecords < ActiveRecord::Migration
  def change
  	change_column_default :records, :EI, 0
  	change_column_default :records, :SN, 0
  	change_column_default :records, :TF, 0
  	change_column_default :records, :JP, 0
  end
end
