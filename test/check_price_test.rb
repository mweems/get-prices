require '../helper/required.rb'
require 'test/unit'
require '../app/check_price.rb'

class CheckPriceTest < Test::Unit::TestCase

  def check_price(price)
    CheckPrice.new(price)
  end

  def test_is_less_than_returns_truthfully
    assert_equal(true, check_price(12.25).is_less_than?(13.00))
    assert_equal(false, check_price(14.25).is_less_than?(13.00))
  end
end