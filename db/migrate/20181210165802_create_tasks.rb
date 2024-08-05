class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :type
      t.string :code
      t.string :name
      t.string :chi_name

      t.timestamps
    end
  end
end
