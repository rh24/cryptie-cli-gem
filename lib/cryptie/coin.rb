require 'pry'

class Cryptie::Coin
  # extend
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :supply, :volume, :day_percent_change
  @@all = []

  def initialize(coin_hash)
    coin_hash.each {|key, value| self.send("#{key}=", value)}
    self.class.all << self
  end

  def self.learn(input)
    coin = self.all[input.to_i-1]
    puts "\nYou've entered ##{input}:"
    puts "\nName: #{coin.name}"
    puts "Symbol: #{coin.symbol}"
    puts "Price: #{coin.price}"
    puts "Supply: #{coin.supply}"
    puts "Market Cap: #{coin.market_cap}"
    coin.supply += " this coin is not mineable" if coin.supply.include?("*")
    # binding.pry
  end

  def self.list
    @list =
    puts "Today's Top 10 Cryptocurrencies by Market Cap:"
    Cryptie::Scraper.all.each.with_index(1) do |coin_hash, index|
      puts "#{index}. #{coin_hash[:name]}  #{coin_hash[:symbol]}   \n"
      break if index == 10
    end
  end

  def self.full_list # Not sure if I want to include this method at all. CLI gets messy
    @full_list =
    puts "Today's Top 10 Cryptocurrencies by Market Cap:"
    # puts "#{table_head_array.join("  ")}\n\n" if I want to display all attributes in one full list
    Cryptie::Scraper.all.each.with_index(1) do |coin_hash, index|
      puts "#{index}. #{coin_hash[:name]}  #{coin_hash[:symbol]}   \n"
      break if index == 10
    end
  end

  def self.find_by_rank(input)
    all.detect {|coin| coin.rank == input}
  end

  def self.all #exposes an array of Coin instances
    @@all
  end

end
