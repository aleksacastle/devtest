class AddAncestryToTargetGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :target_groups, :ancestry, :string
    add_index :target_groups, :ancestry
  end
end
