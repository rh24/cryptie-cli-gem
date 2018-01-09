class Cryptie::Order
  attr_accessor :person
  attr_reader :coin_name, :coin_price, :quantity

  def initialize(coin, spend) # Check if the person has enough spending_balance before order is instantiated
    @coin_name = coin.name
    @coin_price = coin.price.delete("$").to_f
    @quantity = (spend / coin_price)
  end
  # What if I order the same coin? Account for multiple orders of the same coin and how to total them.

  def maximum(coin, dollar_amount)

  end

  def purchase

  end
end
