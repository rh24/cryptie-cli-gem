class Cryptie::Order
  attr_accessor :person
  attr_reader :coin, :quantity

  def initialize(coin, quantity) # Check if the person has enough spending_balance before order is instantiated
    @coin = coin
    @quantity = quantity
    # self.person.orders << self
  end

  def maximum(coin, dollar_amount)

  end
end
