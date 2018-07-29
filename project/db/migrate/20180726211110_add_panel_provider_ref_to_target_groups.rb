class AddPanelProviderRefToTargetGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :target_groups, :panel_provider, foreign_key: true
  end
end
