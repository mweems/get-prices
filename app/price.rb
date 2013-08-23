require '../helper/required.rb'
require_relative 'get_data.rb'
require_relative 'get_prices.rb'
require_relative 'check_price.rb'

class Price

  def find_price
    data = GetData.new('https://www.google.com/search?hl=en&tbm=shop&q=godel+escher+bach&oq=godel+escher+bach&gs_l=products-cc.3..0.7502.10635.0.11034.19.6.1.12.12.0.160.480.5j1.6.0...0.0...1ac.1.f4NQUdEFVeA').get_html
    amount = GetPrices.new(data).lowest_price
    can_buy = CheckPrice.new(amount).can_buy?(14.00)
    puts amount
    puts can_buy
  end
end


foo = Price.new
foo.find_price