class LocationGroup < ApplicationRecord
  belongs_to :panel_provider
  belongs_to :country

end
