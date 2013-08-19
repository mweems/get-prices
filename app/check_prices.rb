class CheckPrices

  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def find_lowest
    @array.sort!
    array[0]
  end

  def check_price(base_price)
    find_lowest < base_price
  end


end
