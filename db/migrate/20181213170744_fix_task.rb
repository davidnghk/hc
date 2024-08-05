class FixTask < ActiveRecord::Migration[5.2]
  def self.up
    add_column :incidents, :task_id, :integer
    remove_column :incidents, :task 
  end
end
