class Cryptie::Person
  attr_accessor :name, :spending_balance
  attr_reader :orders, :coins
  @@all = []

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    self.class.all << self
  end

  def order(coin, quantity)

  end

  def self.all
    @@all
  end


end
