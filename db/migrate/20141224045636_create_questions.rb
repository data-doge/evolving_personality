class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :uid
    	t.string :prompt
    	t.string :choice_a
    	t.string :choice_b
    	t.string :result_a
    	t.string :result_b

      t.timestamps
    end
  end
end
