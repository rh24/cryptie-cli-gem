class Cryptie::Person
  attr_accessor :spending_balance, :account
  attr_reader :name, :coins, :valid_spend, :valid_symbol, :orders

  def initialize(person_name, balance)
    @name = person_name
    @spending_balance = balance
    @orders = [] # A person has many orders
    @coins = {} # A person has many coins through orders
  end

  # def display_coins # A person has many coins through orders
  #   Cryptie::Order.all.each do |o|
  #     puts "#{o.coin.name} (#{o.coin.symbol}):  #{o.quantity}"
  #   end
  #   return nil
  # end

# I separated my previous (above) display_coins method into two pieces:
# 'display_coins' and 'coins'
# Which is the better way to show the has many through relationship?

  def display_coins
    self.coins.each do |coin, quantity|
      puts "#{coin.name} (#{coin.symbol}): #{quantity}"
    end
    return nil
  end

  def coins
    Cryptie::Order.all.each do |o|
      @coins[o.coin] = o.quantity
    end
    @coins
  end

  def order
    order = Cryptie::Order.new(valid_symbol, valid_spend)
    order.person = self
    self.orders << order
    self.spending_balance -= @valid_spend
  end

  def display_account
    puts "\n#{self.name.capitalize}'s updated account information:"
    puts "\n"
    puts "#{self.display_coins}"
    puts "Your account balance is #{spending_balance}."
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
      @valid_symbol = Cryptie::Coin.find_by_symbol(input) # Returns coin instance
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
end
