require '../helper/required.rb'

class GetPrices

  def initialize(html)
    @prices = get_prices(html)
  end

  def lowest_price
    @prices.sort[0]
  end

  private

  def get_prices(html)
    price_array = []
    array = html.split
    array.each do |word|
      match = word.match(/([0-9][0-9]\.[0-9][0-9])/)
      if match
        price_array.push(match.captures[0].to_f)
      end
    end
    price_array
  end


end
