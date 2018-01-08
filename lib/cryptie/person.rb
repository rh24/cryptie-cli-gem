class Cryptie::Person
  attr_reader :name, :spending_balance, :coins, :orders
  @@all = []

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    self.class.all << self
    @orders = []
  end

  def self.all
    @@all
  end


end
