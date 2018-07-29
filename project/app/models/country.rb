class Country < ApplicationRecord
  has_many :location_groups
  belongs_to :panel_provider
  has_many :locations

  validates :code, presence: true, uniqueness: true
  validates :panel_provider, presence: true
end
