require '../helper/required.rb'
require '../app/get_data.rb'
require '../app/get_prices.rb'
require '../app/check_price.rb'

class Price

  def find_price
    data = GetData.new('http://amazon.com/gp/offer-listing/0465026567/ref=tmm_pap_new_olp_sr?ie=UTF8&condition=new&sr=1-1&qid=1377109900').get_html
    if data == nil
      raise "HMMM"
    end
    amount = GetPrices.new(data).lowest_price
    if amount == nil
      raise "#{amount}"
    end
    can_buy = CheckPrice.new(amount).is_less_than?(14.00)
  end
end


foo = Price.new
foo.find_price