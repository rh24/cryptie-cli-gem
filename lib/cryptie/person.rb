class Cryptie::Person
  attr_accessor :name, :spending_balance
  attr_reader :name, :orders, :coins
  @@all = []

  def intialize(name, spending_balance)
    self.name = name
    self.spending_balance = spending_balance
    self.class.all << self
  end

  def order(coin, quantity)
    
  end

  # def name
  #   puts "Please, enter your name:"
  #   name = gets.strip
  #   if name.to_i != 0
  #     puts "Need valid input. Try again."
  #     name
  #   else
  #     @name = name
  #   end
  # end


end
