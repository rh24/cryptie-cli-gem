class Cryptie::Person
  attr_accessor :orders, :spending_balance, :account
  attr_reader :name, :coins
  # @@all = [] Only if I were keeping track of more than one person's account

  def initialize(person_name, balance)
    @name = person_name
    @spending_balance = balance
    @orders = []
    # @coins = []
  end

  def coins # A person has many coins through orders
    @coins = self.orders.each do |o| # Returns self.orders array in terminal. Fix this.
      puts "#{o.coin_name} (#{o.coin_sym}):  #{o.quantity}"
      # How would I account for multiple orders of the same coin?
    end
    return nil
  end

  def order # Work this out
    order = Cryptie::Order.new(valid_symbol, valid_spend)
    order.person = self
    self.orders << order
  end

  def buy_more
    if self.spending_balance == 0
      puts "You're out of money! Would you like to continue purchasing? (y/n)"
      answer = gets.strip.downcase
      if answer == "yes" || ansewr == "y"
        balance
      elsif answer == "no" || answer == "n"
        greeting
        menu
      else
        invalid
      end
    else
      order
      display_account
      puts "-- Enter \"buy more\" to make another purchase, \"menu\" for more options, or \"exit\" to quit. --"
      puts "----------- Once you enter \"list\" or \"exit\" your information will not be saved -------------"
      menu
    end
  end

  def display_account # Should go in Cryptie::Person class?
    puts "\n#{self.name.capitalize}'s updated account information:"
    puts "\n"
    puts "#{self.coins}"
    puts "Your account balance is #{spending_balance}."
        # coin, quantity, remaining balance
  end

  def valid_symbol # Should go in Cryptie::Coin class?
    puts "Which coin would you like to purchase? Enter symbol:"
    input = gets.strip.upcase
    if Cryptie::Coin.find_by_symbol(input) == nil
      puts "Invalid symbol. We could not find this coin. Please, try again or exit."
      valid_symbol until input.downcase == "exit"
      Cryptie:Coin.new.call if input.downcase == "exit"
    else
      Cryptie::Coin.all.detect {|c| c if c.symbol == input} # Returns coin instance
    end
  end

  def valid_spend # Why do I need self in front of spending_balance? It doesn't work otherwise.
    puts "Here is your account balance: $#{self.spending_balance}. How much would you like to spend on this purchase? Enter amount or \"max\"."
    input = gets.strip
    input = input.delete("$") if input.include?("$")
    if input.to_i > 0 && input.to_i <= self.spending_balance
      # self.spending_balance -= input.to_i
      input.to_i
    elsif input.downcase == "max"
      self.spending_balance
    else
      puts "Invalid amount. Try again or \"exit\"."
      valid_spend until input.downcase == "exit"
      Cryptie:Coin.new.call if input.downcase == "exit"
    end
  end

  # def self.find_by_name(name) #Only if I were keeping track of more than one person's account
  #
  # end

  def self.all
    @@all
  end

end
