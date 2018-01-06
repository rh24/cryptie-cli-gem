require 'pry'

class Cryptie::Coin
  # extend
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :volume, :day_percent_change
  @@all = []

  def initialize(coin_hash)
    coin_hash.each {|key, value| self.send("#{key}=", value)}
    self.class.all << self
  end

  def self.list
    @list =
    puts "Today's Top 10 Cryptocurrencies by Market Cap:"
    Cryptie::Scraper.all.each.with_index(1) do |coin_hash, index|
      # binding.pry
      puts "#{index}. #{coin_hash[:name]}  #{coin_hash[:symbol]}   \n"
      break if index == 10
    end
  end

  def self.full_list
    @full_list =
    puts "Today's Top 10 Cryptocurrencies by Market Cap:"
    # puts "#{table_head_array.join("  ")}\n\n" if I want to display all attributes in one full list
    sym_array.each.with_index(1) do |sym, index|
      puts "#{index}. #{name_array[index-1]}  #{sym}   \n"
      break if index == 10
    end
  end

  def learn(input)
    input = input.to_i
    index = input-1
    puts "#{input}. #{name_array[index]} #{sym_array[index]}\n"
    puts "Price: #{@price_array[index]}\n Market Cap: #{@market_cap_array[index]}\n Circulating Supply: #{circulating_suppy_array[index]}\n 24h Trading Vol: #{day_trading_volume[index]}\n"
    puts "* Not mineable"
  end

  def self.all #exposes an array of Coin instances
    @@all
  end

end
