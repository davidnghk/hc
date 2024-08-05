class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :type
      t.string :code
      t.string :name
      t.string :chi_name
      t.integer :status

      t.timestamps
    end
  end
end
