class PanelProvider < ApplicationRecord
  validates :code, presence: true, uniqueness: true

  CODE = %w[times_a 10_arrays times_html].freeze

  def self.calculate_price(code)
    case code
    when CODE[0]
        PanelPrice.times_a
      when CODE[1]
        PanelPrice.ten_arrays
      when CODE[2]
        PanelPrice.times_html
    end
  end
end
