require 'pry'

class Cryptie::CLI

  def call
    Cryptie::Scraper.scrape_all_coins
    Cryptie::Coin.list
    menu
    goodbye
  end

  def menu # Fix CLI output. currently I have to type exit for every input+1 that I enter.
    puts "Which coin would you like to learn more about? Enter rank \#:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase # Need to sanitize the input later
      if input == "list"
        Cryptie::Coin.list
      elsif input.to_i.is_a?(Integer) && input.to_i != 0
        Cryptie::Coin.find_by_rank(input)
      elsif input == "exit"
        puts "See you later!"
        break
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
