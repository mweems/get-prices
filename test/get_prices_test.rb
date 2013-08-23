require '../helper/required.rb'
require 'test/unit'
require '../app/get_prices.rb'



class GetPricesTest < Test::Unit::TestCase

  def get_prices(html)
    GetPrices.new(html)
  end

  def test_lowest_price_finds_a_single_price
       html = <<-HTML
    <html><body>
    <div class='psliprice'><b>$14.85</b></div>    
    </body></html>
    HTML
    assert_equal(14.85, get_prices(html).lowest_price)
  end

  def test_lowest_price_returns_smallest_amount
    html = <<-HTML
    <html><body>
    <div class='psliprice'><b>$14.85</b></div>    
    <div class='psliprice'><b>$12.85</b></div>    
    <div class='psliprice'><b>$17.85</b></div>    
    </body></html>
    HTML

    assert_equal(12.85, get_prices(html).lowest_price)
  end

  def test_get_prices_ignores_numbers_that_arent_prices
       html = <<-HTML
    <html><body>
    <div class='psliprice'><b>$14.85</b></div>    
    <div class='psliprice'><b>$12.85</b></div>    
    <div class='psliprice'><b>$17.85</b></div>    
    <div class='psliprice'><a>$11.75</a></div>    
    </body></html>
    HTML

    assert_equal(12.85, get_prices(html).lowest_price)    
  end

end