class CreateFixes < ActiveRecord::Migration[5.2]
  def change
    create_table :fixes do |t|
      t.string :type
      t.string :code
      t.string :name
      t.string :chi_name
      t.boolean :is_active?, :default => true

      t.timestamps
    end
  end
end
