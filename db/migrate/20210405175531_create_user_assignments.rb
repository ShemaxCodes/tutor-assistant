class CreateUserAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_assignments do |t|
      t.belongs_to :user
      t.belongs_to :assignment 

      t.timestamps
    end
  end
end
