class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.string :type
      t.string :task
      t.datetime :incident_datetime
      t.datetime :request_datetime
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.string :ref
      t.integer :status
      t.integer :source
      t.string :heading
      t.text :details

      t.timestamps
    end
  end
end
