require '../helper/required.rb'

class CheckPrice

  def initialize(price)
    @price = price
  end

  def is_less_than?(amount)
    @price <= amount
  end

end
