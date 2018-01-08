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
        person = Cryptie::Person.new(person_name, balance)
        person.order = Cryptie::Order.new(coin, quantity)
        # binding.pry
      elsif input == "exit"
        goodbye
        exit
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
        menu
      end
    end
  end

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
