require '../helper/required.rb'
require 'test/unit'
require '../app/get_prices.rb'



class GetPricesTest < Test::Unit::TestCase

 
  #   @text = File.read('../helper/test_file.txt')
  

  def get_prices(html)
    GetPrices.new(html)
  end

  def test_lowest_price_finds_a_single_price
    html = <<-HTML
    <html><body>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $14.85    </span>
    </body></html>
    HTML
    assert_equal(14.85, get_prices(html).lowest_price)
  end

  def test_lowest_price_returns_smallest_amount
    html = <<-HTML
    <html><body>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $14.85    </span>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $12.85    </span>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $17.85    </span>    
    </body></html>
    HTML

    assert_equal(12.85, get_prices(html).lowest_price)
  end

  def test_get_prices_ignores_numbers_that_arent_prices
    html = <<-HTML
    <html><body>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $14.85    </span>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $12.85    </span>
    <span class='a-size-large a-color-price olpOfferPrice a-text-bold'>        $17.85    </span>
    <span>        $11.85    </span>    
    </body></html>
    HTML

    assert_equal(12.85, get_prices(html).lowest_price)    
  end

end