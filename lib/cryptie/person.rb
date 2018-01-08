class Cryptie::Person
  attr_reader :name, :spending_balance, :order, :coins
  @@all = []
  @orders = []

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    self.class.all << self
  end

  def orders
    @orders
  end

  def self.all
    @@all
  end


end
