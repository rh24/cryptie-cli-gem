require 'pry'

class Cryptie::Coin
  # extend
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :supply, :volume, :day_percent_change
  @@all = []

  def initialize(coin_hash)
    coin_hash.each {|key, value| self.send("#{key}=", value)}
    # binding.pry
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
    puts "#{input}. #{self.all[index].name} #{self.all[index].symbol}\n"
    puts "Price: #{self.all[index].price}\n Market Cap: #{self.all[index].market_cap}\n Circulating Supply: #{self.all[index].supply}\n 24h Trading Vol: #{self.all[index].volume}\n"
    puts "Note: * not mineable"
  end

  def self.find_by_rank(input)
    all.detect {|coin| coin.rank == input}
  end

  def self.all #exposes an array of Coin instances
    @@all
  end

end
