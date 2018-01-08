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
        order
      elsif input == "list"
        Cryptie::Coin.list
        order
      elsif input == "order"
        name
        # spending_balance
        # binding.pry
        # person = Cryptie::Person(name, spending_balance)
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
        menu
      end
    end
  end

  def order
    puts "\nWould you like to place an order? Enter \"order\" to get started or \"menu\" for more options."
  end

  def name
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
      @name = input
    end
  end

  def spending_balance
    puts "Please, enter your spending balance:"
    input = gets.strip.to_i
    if input.to_i == 0
      puts "You have no money to spend. Please, enter valid balance, \"exit\", or type \"menu\" for more options."
      spending_balance
    elsif input == "menu"
      menu
    elsif input == "exit"
      goodbye
      exit
    else
      @spending_balance = input
    end
  end


  def goodbye
    puts "See you later! Check back again soon. Crypto moves quickly."
  end

end
