class AddResponsibleToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :responsible_user_id, :integer
  end
end
