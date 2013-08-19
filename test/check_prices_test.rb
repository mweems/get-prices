require 'test/unit'
require '../app/check_prices.rb'

class GetPricesTest < Test::Unit::TestCase

  def test_lowest_price
    prices = [45,7,1,8]
    lowest_price = CheckPrices.new(prices)
    assert_equal(1, lowest_price.find_lowest)
  end

  def test_checks_price_against_base_price
    prices = [45,7,1,8]
    lowest_price = CheckPrices.new(prices)
    assert(lowest_price.check_price(4))
  end
end