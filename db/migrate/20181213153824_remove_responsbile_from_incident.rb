class RemoveResponsbileFromIncident < ActiveRecord::Migration[5.2]
  def change
    remove_column :incidents, :responsbile_user_id, :integer
  end
end
