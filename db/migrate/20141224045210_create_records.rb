class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.belongs_to :user
    	t.integer "EI"
    	t.integer "SN"
    	t.integer "TF"
    	t.integer "JP"

      t.timestamps
    end
  end
end
