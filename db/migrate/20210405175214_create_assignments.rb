class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :instructions
      t.datetime :due_date
      t.integer :score 
         
      t.timestamps
    end
  end
end
