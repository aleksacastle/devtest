class AddCountryRefToLocations < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :country, foreign_key: true
  end
end
