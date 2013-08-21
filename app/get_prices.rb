require '../helper/required.rb'
require 'nokogiri'

class GetPrices

  def initialize(html)
    @prices = get_prices(html)
  end

  def lowest_price  
    @prices.sort[0]
  end

  private

  def get_prices(html)
    doc = Nokogiri::HTML(html)
    price_string = doc.css("span[class]").text.strip
    price_array = price_string.gsub("$","").split
    price_array.map { |price| price.to_f}
  end


end
