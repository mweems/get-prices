require 'test/unit'
require '../app/get_prices.rb'


class GetPricesTest <Test::Unit::TestCase

  def setup
    @text = HTTParty.get('http://www.amazon.com/gp/offer-listing/0465026567/sr=/qid=/ref=olp_tab_all?ie=UTF8&colid=&coliid=&me=&qid=&seller=&sr=')
    @user = GetPrices.new
  end

end