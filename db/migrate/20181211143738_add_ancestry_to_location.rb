class AddAncestryToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :ancestry, :string
    add_index :locations, :ancestry
  end
end
