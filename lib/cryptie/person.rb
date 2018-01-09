class Cryptie::Person
  attr_accessor :orders, :spending_balance, :account
  attr_reader :name, :coins

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    @orders = []
    # @coins = []
    # binding.pry
  end

  def coins # A person has many coins through orders
    @coins = self.orders.each do |o|
      puts "#{o.coin_name}: #{o.quantity}"
      # How would I account for multiple orders of the same coin?
    end
  end

  def order
    order = Cryptie::Order.new(valid_symbol, valid_spend)
          # binding.pry
    order.person = self
    # self.orders.each do |o|
    #   if o.coin_name == order.coin_name
    #     o.quantity += order.quantity
    #   else
    #     self.orders << order
    #   end
    # end
  end

  def display_account # Should go in Cryptie::Person class?
    puts "\n#{self.name.capitalize}'s updated account information:"
    puts "\n#{self.coins}"
        # coin, quantity, remaining balance
  end

  def valid_symbol # Should go in Cryptie::Coin class?
    puts "Which coin would you like to purchase? Enter symbol:"
    input = gets.strip.upcase
    if Cryptie::Coin.all.detect {|c| c if c.symbol == input} == nil
      puts "Invalid symbol. We could not find this coin. Please, try again."
      valid_symbol
    else
      Cryptie::Coin.all.detect {|c| c if c.symbol == input} # Returns coin instance
    end
  end

  def valid_spend
    puts "Here is your account balance: $#{self.spending_balance}. How much would you like to spend on this purchase? Enter amount or \"max\"."
    input = gets.strip
    input = input.delete("$") if input.include?("$")
    if input.to_i > 0 && input.to_i <= self.spending_balance
      # self.spending_balance -= input.to_i
      input.to_i
    elsif input.downcase == "max"
      self.spending_balance
    else
      puts "Invalid amount. Try again."
      valid_spend
    end
  end

  def self.all
    @@all
  end

end
