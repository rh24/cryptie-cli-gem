require 'pry'

class Cryptie::Scraper
  @@all =[]

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  first =  doc.css('table').css('.js-summary-table')
  first.css('td').css('.currency-name')

  # Below variables return arrays of strings. If I want to operate on them, I need to turn them into integers.

  @table_head_array = first.css('th').collect do |rank|
    rank.text.strip
  end
  # Gives me an array of the table head elements
  #=> ["#", "Name", "Symbol", "Market Cap", "Price", "Circulating Supply", "Volume (24h)", "% 1h", "% 24h", "% 7d"]

  @rank_array = first.css('td').css('.text-center').collect do |rank|
    rank.text.strip
  end
  # Gives me an array of ranked numbers
  #=> ["1", "2", "3","4"] etc.

  @sym_array = first.css('td').css('.currency-name').css('span a').collect do |sym|
    sym.text.strip
  end
  # returns an array of coin symbols
  #=> ["BTC", "XRP", "ETH", "BCH", "ADA", "XEM"]

  @name_array = first.css('td').css('.currency-name').css('.currency-name-container').collect do |name|
    name.text
  end
  # returns an array of coin names
  #=> ["Bitcoin", "Ripple", "Ethereum", "Bitcoin Cash", "Cardano", "NEM"]

  @market_cap_array = first.css('td').css('.market-cap').collect do |mc|
    mc.text.strip
  end

  @price_array = first.css('td').css('.price').collect do |price|
    price.text.strip
  end

  @circulating_suppy_array = first.css('td').css('.circulating-supply').collect do |supply|
    no_space = supply.text.gsub(/\s+/, "")
    no_space.gsub("*", " *")
  end
  # returns circulating supply with mineable asterisk

  @day_trading_vol = first.css('td').css('.volume').collect do |vol|
    vol.text.strip
  end

  @hr_percent_change = first.css('td').css('.percent-1h').collect do |h|
    h.text.strip
  end

  @day_percent_change = first.css('td').css('.percent-24h').collect do |day|
    day.text.strip
  end

  @week_percent_change = first.css('td').css('.percent-7d').collect do |week|
    week.text.strip
  end

  def self.all
    @@all
  end

  def self.create_coins # Make each Coin instance here
    i = 0
    while i < 10 do
      coin_hash = {
        :rank => @rank_array[i],
        :name => @name_array[i],
        :symbol => @sym_array[i],
        :price => @price_array[i],
        :supply => @circulating_suppy_array[i],
        :market_cap => @market_cap_array[i],
        :volume => @day_trading_vol[i],
        :day_percent_change => @day_percent_change[i]
      }
      all << coin_hash
      coin = Cryptie::Coin.new(coin_hash)
      i += 1
    end
          # binding.pry
  end

end
