require 'pry'

class Cryptie::CLI

  def call
    Cryptie::Scraper.create_coins
    Cryptie::Coin.list
    menu
    goodbye
  end

  def menu
    puts "Which coin would you like to learn more about? Enter rank \#:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase # Need to sanitize the input later
      if input == "list"
        Cryptie::Coin.list
      elsif input == "exit"
        puts "See you later!"
      elsif input.to_i.is_a?(Integer) && input.to_i != 0
        Cryptie::Coin.learn(input)
      else
        puts "Not sure what you want. Try again."
        puts "Please, enter a number 1-30, or \"exit\" to leave:"
        menu
      end
    end
  end

  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
