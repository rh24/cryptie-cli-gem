class Cryptie::Person
  attr_reader :name, :spending_balance, :orders, :coins
  @@all = []

  def intialize#(name, spending_balance)
    # @name = name
    # @spending_balance = spending_balance
    # self.spending_balance = spending_balance
    self.class.all << self
  end

  def name=(input)
    # puts "Please, enter your name:"
    # input = gets.strip
    # if input.to_i.is_a?(Integer) && input.to_i != 0
    #   puts "Need valid name. Try again, \"exit\" or \"menu\" for more options."
    #   name
    # elsif input == "menu"
    #   menu
    # elsif input == "exit"
    #   goodbye
    #   exit
    # else
      @name = input
    # end
  end

  def spending_balance=(input)
    # puts "Please, enter your spending balance:"
    # input = gets.strip.to_i
    # if input.to_i <= 0
    #   puts "You have no money to spend. Please, enter valid balance, \"exit\", or type \"menu\" for more options."
    #   spending_balance
    # elsif input == "menu"
    #   menu
    # elsif input == "exit"
    #   goodbye
    #   exit
    # else
      @spending_balance = input
    # end
  end

  def order(coin, quantity)

  end


end
