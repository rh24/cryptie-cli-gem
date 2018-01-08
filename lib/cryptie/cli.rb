require 'pry'

class Cryptie::CLI

  def call
    Cryptie::Scraper.scrape_all_coins
    Cryptie::Coin.list
    menu
  end

  def menu
    puts "  \nWhich coin would you like to learn more about?\n  Enter rank \# or \"list\" to see all coins:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase # Need to sanitize the input later
      if input.to_i != 0
        Cryptie::Coin.learn_more(input)
        puts "\nWould you like to place an order? Enter \"order\" to get started or \"menu\" for more options."
      elsif input == "list"
        Cryptie::Coin.list
        puts "\nWould you like to place an order? Enter \"order\" to get started or \"menu\" for more options."
      elsif input == "order"
        # order
        #OR
        person = Cryptie::Person.new(person_name, balance)
        person.order
        binding.pry
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
        menu
      end
    end
  end

  # def order
  #   order = Cryptie::Order.new(valid_symbol, valid_spend)
  #   order.person = @person
  #   @person.orders << order
  #
  #   # display account:
  #     # person.name has
  #       # coin, quantity, remaining balance
  # end
  #
  # def display_account # Should go in Cryptie::Person class?
  #
  # end
  #
  # def valid_symbol # Should go in Cryptie::Coin class?
  #   puts "Which coin would you like to purchase? Enter symbol:"
  #   input = gets.strip.upcase
  #   if Cryptie::Coin.all.detect {|c| c.symbol == input} == nil
  #     puts "Invalid symbol. We could not find this coin. Please, try again."
  #     valid_symbol
  #   else
  #     input
  #   end
  # end
  #
  # def valid_spend # Should go in Cryptie::Person class?
  #   puts "Here is your account balance: $#{@person.spending_balance}. How much would you like to spend on this purchase? Enter amount or \"max\"."
  #   spend = gets.strip.to_i
  #   if spend > 0 && spend <= @person.spending_balance
  #     @person.spending_balance -= spend
  #     spend
  #   elsif spend == "max"
  #     # calculate max possible purchase
  #   else
  #     puts "Invalid amount. Try again."
  #     valid_spend
  #   end
  # end

  def person_name
    puts "Please, enter your name:"
    input = gets.strip
    if input.to_i.is_a?(Integer) && input.to_i != 0
      puts "Need valid name. Try again, \"exit\" or \"menu\" for more options."
      name
    elsif input == "menu"
      menu
    elsif input == "exit"
      goodbye
      exit
    else
      input
    end
  end

  def balance
    puts "Please, enter your spending balance:"
    input = gets.strip.to_i
    if input.to_i <= 0
      puts "You have no money to spend. Please, enter valid balance, \"exit\", or type \"menu\" for more options."
      spending_balance
    elsif input == "menu"
      menu
    elsif input == "exit"
      goodbye
      exit
    else
      input
    end
  end

  def goodbye
    puts "See you later! Check back again soon. Crypto moves quickly."
  end

end
