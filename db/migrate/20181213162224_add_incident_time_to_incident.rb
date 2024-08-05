class AddIncidentTimeToIncident < ActiveRecord::Migration[5.2]
  def change
    add_column :incidents, :incident_time, :time
  end
end
