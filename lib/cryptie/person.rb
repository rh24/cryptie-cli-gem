class Cryptie::Person
  attr_accessor :orders, :spending_balance, :account
  attr_reader :name, :coins

  def initialize(name, spending_balance)
    @name = name
    @spending_balance = spending_balance
    @orders = []
    # binding.pry
  end

  def coins
    @coins = self.orders.each {|o| puts "#{o.coin}"}
  end

  def order
    order = Cryptie::Order.new(valid_symbol, valid_spend)
    order.person = self
    self.orders << order

    # display account:
      # person.name has
        # coin, quantity, remaining balance
  end

  def display_account # Should go in Cryptie::Person class?

  end

  def valid_symbol # Should go in Cryptie::Coin class?
    puts "Which coin would you like to purchase? Enter symbol:"
    input = gets.strip.upcase
    if Cryptie::Coin.all.detect {|c| c.symbol == input} == nil
      puts "Invalid symbol. We could not find this coin. Please, try again."
      valid_symbol
    else
      input
    end
  end

  def valid_spend # Should go in Cryptie::Person class?
    puts "Here is your account balance: $#{self.spending_balance}. How much would you like to spend on this purchase? Enter amount or \"max\"."
    spend = gets.strip.to_i
    if spend > 0 && spend <= spending_balance
      self.spending_balance -= spend
      spend
    elsif spend == "max"
      # calculate max possible purchase
    else
      puts "Invalid amount. Try again."
      valid_spend
    end
  end

  def self.all
    @@all
  end

end
