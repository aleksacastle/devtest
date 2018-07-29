require_relative '../../lib/scrappers/scrapper'
require_relative '../../lib/scrappers/letter'
require_relative '../../lib/scrappers/nodes'

class PanelPrice < ApplicationRecord
  include Scrapper
  include Letter
  include Nodes

  URI_1 =  "http://time.com".freeze
  LETTER_1 = 'a'.freeze

  @panel_price = PanelPrice.new

  def self.times_a
    page = @panel_price.scrap(URI_1)
    @panel_price.count_letter(page, LETTER_1)
  end

  def self.times_html
    page = @panel_price.scrap(URI_1)
    @panel_price.count_nodes(page)
  end

  def self.ten_arrays
  end
end
