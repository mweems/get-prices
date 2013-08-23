require '../helper/required.rb'
require 'nokogiri'

class GetPrices

  def initialize(url)
    @prices = get_prices(url)
  end

  def lowest_price  
    @prices.sort[0]
  end

  private

  def get_prices(url)
    doc = Nokogiri::HTML(url)
    price_array = []
    price_string = doc.css("div.psliprice b")
    price_string.map{|price| price_array << price.text}
    price_array.map{|price| price.gsub("$","").to_f}
  end


end