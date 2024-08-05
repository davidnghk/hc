class AddUserToWorkflow < ActiveRecord::Migration[5.2]
  def change
    add_reference :workflows, :user, foreign_key: true
    remove_column :workflows, :manage_role_id, :integer 
  end
end
