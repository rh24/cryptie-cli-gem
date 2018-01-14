class Cryptie::Coin
  attr_accessor :order, :rank, :symbol, :name, :market_cap, :price, :volume, :hr_percent_change, :day_percent_change, :week_percent_change
  attr_reader :supply
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

  def self.find_by_rank(input)
    all.detect {|coin| coin.rank == input}
  end

  def self.find_by_symbol(input)
    all.detect {|coin| coin.symbol == input}
  end

  def self.list # All coins have been scraped. Change index to display more coins.
    @list =
    puts "\nToday's Top 20 Cryptocurrencies by Market Cap:"
    puts "\n"
    Cryptie::Scraper.all.each.with_index(1) do |coin_hash, index|
      puts "#{index}. #{coin_hash[:name]}  #{coin_hash[:symbol]}   \n"
      break if index == 20
    end
  end

  def self.all #exposes an array of Coin instances
    @@all
  end

end
