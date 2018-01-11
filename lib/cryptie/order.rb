class Cryptie::Order
  attr_accessor :person, :quantity
  attr_reader :coin #:quantity
  @@all = []

  def initialize(coin, spend)
    @coin = coin
    @quantity = (spend / coin.price.delete("$").to_f)
    if self.class.all.detect {|o| o.coin.name == @coin.name}
      add_to_existing_coin
    else
      self.class.all << self
    end
  end

  def add_to_existing_coin
    self.class.all.each do |o|
      if o.coin.name == @coin.name
        o.quantity += @quantity
      else
        next
      end
    end
  end

  def self.all
    @@all
  end
end
