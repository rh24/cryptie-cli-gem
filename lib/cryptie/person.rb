class Cryptie::Person
  attr_accessor :orders, :spending_balance, :account
  attr_reader :name, :coins, :valid_spend
  # @@all = [] Only if I were keeping track of more than one person's account

  def initialize(person_name, balance)
    @name = person_name
    @spending_balance = balance
    @orders = []
  end

  def coins # A person has many coins through orders
    @coins = self.orders.each do |o|
      puts "#{o.coin.name} (#{o.coin.symbol}):  #{o.quantity}"
      # How would I account for multiple orders of the same coin?
    end
    return nil
  end

  def order
    order = Cryptie::Order.new(valid_symbol, valid_spend)
    order.person = self
    self.spending_balance -= @valid_spend
    self.orders << order
  end

  def display_account
    puts "\n#{self.name.capitalize}'s updated account information:"
    puts "\n"
    puts "#{self.coins}"
    puts "Your account balance is #{spending_balance}."
        # coin, quantity, remaining balance
  end

  def valid_symbol # Should go in Cryptie::Coin class? No, because a person is responsible for inputting a valid symbol
    puts "Which coin would you like to purchase? Enter symbol:"
    input = gets.strip.upcase
    if input.downcase == "exit"
      Cryptie::CLI.all.first.return_menu
    elsif Cryptie::Coin.find_by_symbol(input) == nil
      puts "Invalid symbol. We could not find this coin. Please, try again or exit."
      valid_symbol
    else
      Cryptie::Coin.find_by_symbol(input) # Returns coin instance
    end
  end

  def valid_spend # Why do I need self in front of spending_balance? It doesn't work otherwise.
    puts "Here is your account balance: $#{self.spending_balance}. How much would you like to spend on this purchase? Enter amount or \"max\"."
    input = gets.strip
    input = input.delete("$") if input.include?("$")
    if input.downcase == "exit"
      Cryptie::CLI.all.first.return_menu
    elsif input.to_i > 0 && input.to_i <= self.spending_balance
      @valid_spend = input.to_i
    elsif input.downcase == "max"
      @valid_spend = self.spending_balance
    else
      puts "Invalid amount. Try again or \"exit\"."
      valid_spend
    end
  end

  # def self.find_by_name(name) #Only if I were keeping track of more than one person's account
  #
  # end

  def self.all
    @@all
  end

end
