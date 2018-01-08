require 'pry'

class Cryptie::Coin
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :supply, :volume, :hr_percent_change, :day_percent_change, :week_percent_change
  @@all = []

  def initialize(coin_hash)
    coin_hash.each {|key, value| self.send("#{key}=", value)}
    self.class.all << self
  end

  def supply=(supply)
    if supply.include?("*")
      supply += " this coin is not mineable"
      @supply = supply
    else
      @supply = supply
    end
  end

  def self.learn_more(input)
    coin = all[input.to_i-1]
    puts "\nYou've entered ##{input}:"
    puts "\nName: #{coin.name}"
    puts "Symbol: #{coin.symbol}"
    puts "Price: #{coin.price}"
    puts "Circulating Supply: #{coin.supply}"
    puts "Market Cap: #{coin.market_cap}"
    puts "1h Change: #{coin.hr_percent_change}"
    puts "24h Change: #{coin.day_percent_change}"
    puts "7d Change: #{coin.week_percent_change}"
  end

  def self.list # All coins have been scraped. Change index to display more coins.
    @list =
    puts "Today's Top 10 Cryptocurrencies by Market Cap:"
    puts "\n"
    Cryptie::Scraper.all.each.with_index(1) do |coin_hash, index|
      puts "#{index}. #{coin_hash[:name]}  #{coin_hash[:symbol]}   \n"
      break if index == 10
    end
  end

  # def self.find_by_rank
  #
  #   all.detect {|coin| coin.rank == input}
  # end

  def self.all #exposes an array of Coin instances
    @@all
  end

end
