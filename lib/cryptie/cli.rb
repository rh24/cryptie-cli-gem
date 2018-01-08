require 'pry'

class Cryptie::CLI
  attr_reader :person_name

  def call
    Cryptie::Scraper.scrape_all_coins
    Cryptie::Coin.list
    menu
  end

  def menu
    puts "Which coin would you like to learn more about? Enter rank \#:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase # Need to sanitize the input later
      if input.to_i != 0
        Cryptie::Coin.learn_more(input)
      elsif input == "list"
        Cryptie::Coin.list
      elsif input == "order"
        person_name
      elsif input == "exit"
        puts "See you later!"
        exit
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
        menu
      end
    end
  end

  def person_name
    puts "Please, enter your name:"
    name = gets.strip
    if name.to_i != 0
      puts "Need valid input. Try again."
      person_name
    else
      @person_name = name
    end
  end

  # def spending_balance
  #   puts "Please, enter your spending balance:"
  #   account_balance = gets.strip.to_i
  #   if account_balance.to_i == 0
  #     puts "You have no money to spend. Please, enter valid balance, or type \"menu\" for more options:"
  #     account_balance = gets.strip.to_i
  #     else
  #       Cryptie::Person(name, account_balance)
  #     Cryptie::Person(name)
  #     puts "Which coin would you like to purchase?"
  #   end
  # end


  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
