class Cryptie::Person
  attr_accessor :orders
  attr_reader :name, :spending_balance, :coins

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    @orders = []
    # binding.pry
  end

  def coins
    @coins = self.orders.each {|o| puts "#{o.coin}"}
  end

  def self.all
    @@all
  end

end
