class AddPanelProviderRefToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :panel_provider, foreign_key: true
  end
end
