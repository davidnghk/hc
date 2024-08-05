class CreateWorkflows < ActiveRecord::Migration[5.2]
  def change
    create_table :workflows do |t|
      t.string :Incident_type
      t.integer :location_id
      t.integer :manage_role_id

      t.timestamps
    end
  end
end
