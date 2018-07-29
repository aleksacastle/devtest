module Scrapper
  require 'nokogiri'
  require 'open-uri'

  def scrap(uri)
    Nokogiri::HTML(open(uri))
  end
end
