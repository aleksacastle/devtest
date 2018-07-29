class CreateLocationGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :location_groups do |t|
      t.string :name
      t.belongs_to :country, index: true
      t.references :panel_provider

      t.timestamps
    end
  end
end
