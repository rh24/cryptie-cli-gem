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
      when "1"
        # coin = Cryptie::Coin.new(Cryptie::Coin.all[1]) # BTC Hash
        coin.learn(1)
      when "2"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[2]) # XRP Hash
        coin.learn(2)
      when "3"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[3])
        coin.learn(3)
      when "4"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[4])
        coin.learn(4)
      when "5"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[5])
        coin.learn(5)
      when "6"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[6])
        coin.learn(6)
      when "7"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[7])
        coin.learn(7)
      when "8"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[8])
        coin.learn(8)
      when "9"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[9])
        coin.learn(9)
      when "10"
        puts "xrp stats"
        coin = Cryptie::Coin.new(Cryptie::Coin.all[10])
        coin.learn(10)
      when "exit"
        puts "See you later!"
      when input == "list" # this won't print in my terminal! it gets stuck :(
        menu
      else
        puts "Not sure what you want. Try again."
        puts "Please, enter a number 1-30, or \"exit\" to leave:"
      end
    end
  end

  def goodbye
    puts "Check back again soon! Crypto moves quickly."
  end

end
