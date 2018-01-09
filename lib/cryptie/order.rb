class Cryptie::Order
  attr_accessor :person
  attr_reader :coin_name, :coin_sym, :coin_price, :quantity

  def initialize(coin, spend)
    @coin_name = coin.name # Too long for CLI
    @coin_sym = coin.symbol
    @coin_price = coin.price.delete("$").to_f
    @quantity = (spend / coin_price)
  end
  # What if I order the same coin? Account for multiple orders of the same coin and how to total them.

  def maximum(coin, dollar_amount)

  end

  def purchase

  end
end
