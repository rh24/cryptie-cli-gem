require 'pry'

class Cryptie::CLI

  def call
    Cryptie::Scraper.create_coins
    Cryptie::Coin.list
    input = gets.strip.to_i
    Cryptie::Coin.learn(input)
    # menu
    # goodbye
  end

  def menu
    puts "Which coin would you like to learn more about? Enter rank \#:"
    input = nil
    while input != "exit" do
      input = gets.strip
      case input
      when input.is_a?(Integer) # this line is broken
        Cryptie::Coin.learn(input) # entered 1, but nothing is printing. terminal is stuck until i exit
      when input == "list" # this line is broken
        Cryptie::Coin.list
      when "exit"
        puts "See you later!"
      # else
      #   puts "Not sure what you want. Try again."
      #   puts "Please, enter a number 1-30, or \"exit\" to leave:"
      end
    end
  end

  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
