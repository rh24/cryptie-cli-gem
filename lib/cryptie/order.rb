class Cryptie::Order
  attr_accessor :person

  def intialize(coin, quantity) # Check if the person has enough spending_balance before order is instantiated

    self.person.orders << self
  end

  def maximum(coin, dollar_amount)

  end
end
