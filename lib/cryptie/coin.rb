require 'pry'

class Coin
  # extend
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :volume, :day_percent_change
  @@all = []

  def initialize(coin_hash)
    coin_hash.each {|key, value| self.send("#{key}=", value)}
    self.class.all << self
  end

  def learn(input)
    input = input.to_i
    index = input-1
    puts "#{input}. #{name_array[index]} #{sym_array[index]}\n"
    puts "Price: #{@price_array[index]}\n Market Cap: #{@market_cap_array[index]}\n Circulating Supply: #{circulating_suppy_array[index]}\n 24h Trading Vol: #{day_trading_volume[index]}\n"
    puts "* Not mineable"
  end

  def self.all
    @@all
  end

  def rank
    @rank =
  end

  def symbol
    @symbol =
  end

  def name
    @name =
  end

  def market_cap
    @market_cap =
  end

  def price
    @price =
  end

  def volume
    @volume =
  end

  def hr_percent_change
    @hr_percent_change =
  end

  def day_percent_change
    @day_percent_change =
  end

  def week_percent_change
    @week_percent_change =
  end


# Create a module for finding methods
  def self.find_by_name_rank_or_symbol(rank=nil, name=nil, symbol=nil)
    if rank != nil
      @coin_list.detect(rank)
  end

  def self.find_by_rank(input)

  end

  def self.find_by_symbol(sym)

  end

  def self.find_by_price_range(price)

  end

# Create a module for class sorting methods
  def self.sort_by_rank

  end

  def self.sort_by_name

  end

  def self.sort_by_symbol

  end

  def self.sort_by_market_cap

  end

  def self.sort_by_price

  end

  def self.sort_by_volume

  end

  def self.sort_by_hr_percent_change

  end

  def self.sort_by_day_percent_change

  end

  def self.sort_by_week_percent_change

  end
end
end
