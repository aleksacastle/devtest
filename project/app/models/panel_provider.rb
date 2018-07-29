class PanelProvider < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  def self.calculate_price
  end
end
