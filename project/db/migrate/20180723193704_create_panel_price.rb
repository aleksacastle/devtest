class CreatePanelPrice < ActiveRecord::Migration[5.2]
  def change
    create_table :panel_prices do |t|
      t.string :name
      t.decimal :price
      t.references :panel_provider
      
      t.timestamps
    end
  end
end
