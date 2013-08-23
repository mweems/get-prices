require '../helper/required.rb'

class CheckPrice

  def initialize(price)
    @price = price
  end

  def can_buy?(amount)
    @price <= amount
  end

end
