class CreatePersonalityTypes < ActiveRecord::Migration
  def change
    create_table :personality_types do |t|
      t.belongs_to :record
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end
