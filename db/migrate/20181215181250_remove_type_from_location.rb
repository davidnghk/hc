class RemoveTypeFromLocation < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :Type, :string
  end
end
