class Cryptie::Order
  attr_accessor :person

  def intialize(coin, quantity)
    
    self.person.orders << self
  end

  def maximum(coin, dollar_amount)

  end
end
