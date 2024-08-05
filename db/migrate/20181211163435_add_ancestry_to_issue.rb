class AddAncestryToIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :ancestry, :string
    add_index :issues, :ancestry
  end
end
