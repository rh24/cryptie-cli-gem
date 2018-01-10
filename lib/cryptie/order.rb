class Cryptie::Order
  attr_accessor :person
  attr_reader :coin, :quantity

  def initialize(coin, spend)
    @coin = coin
    @quantity = (spend / coin.price.delete("$").to_f)
  end
  # What if I order the same coin? Account for multiple orders of the same coin and how to total them.

end
