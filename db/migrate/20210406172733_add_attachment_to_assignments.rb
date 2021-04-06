class AddAttachmentToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :attachment, :string
  end
end
