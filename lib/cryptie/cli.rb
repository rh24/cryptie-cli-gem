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
    # input = gets.strip.to_i # Sanitize the input later
    input = nil
    while input != "exit" do
      input = gets.strip
      case input
      when input.to_i.is_a?(Integer) # this line is broken
        learn(input) # entered 1, but nothing is printing. terminal is stuck
      when "exit"
        puts "See you later!"
      when input == "list" # this line is broken
        Cryptie::Coin.list
      # else
      #   puts "Not sure what you want. Try again."
      #   puts "Please, enter a number 1-30, or \"exit\" to leave:"
      end
    end
  end

  def learn(input)
    coin = Cryptie::Coin.all[input]
    puts "You've entered #{input}."
    puts "Name: #{coin.name}"
    puts "Symbol: #{coin.symbol}"
    puts "Price: #{coin.price}"
    puts "Supply: #{coin.supply}"
    puts "Market Cap: #{coin.market_cap}"
  end

  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
