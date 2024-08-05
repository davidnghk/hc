class AddWorkerToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :responsbile_user_id, :integer
    add_column :incidents, :worker_user_id, :integer
  end
end
