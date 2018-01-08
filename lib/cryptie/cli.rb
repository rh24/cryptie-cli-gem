require 'pry'

class Cryptie::CLI

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
      elsif input == "exit"
        puts "See you later!"
        exit
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
        menu
      end
    end
  end

  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
