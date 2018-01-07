require 'pry'

class Cryptie::Scraper
  @@all =[]

  def self.scrape_all_coins
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

    doc.css('.js-summary-table').css('td').each do |coin|
      coin_hash = {
        :rank => coin.css('.text-center').text.strip,
        :name => coin.css('.currency-name').css('.currency-name-container').text.strip,
        :symbol => coin.css('.currency-name').css('span a').text.strip,
        :price => coin.css('.price').text.strip,
        :supply => coin.css('.circulating-supply').text.gsub(/\s+/, "").gsub("*", " *"),
        :market_cap => coin.css('.market-cap').text.strip,
        :volume => coin.css('.volume').text.strip,
        :day_percent_change => coin.css('.percent-24h').text.strip
      }

      coin = Cryptie::Coin.new(coin_hash)
      binding.pry
    end
  end
  # binding.pry

  # Below variables return arrays of strings. If I want to operate on them, I need to turn them into integers.

#   @table_head_array = doc.css('th').collect do |rank|
#     rank.text.strip
#   end
#   # Gives me an array of the table head elements
#   #=> ["#", "Name", "Symbol", "Market Cap", "Price", "Circulating Supply", "Volume (24h)", "% 1h", "% 24h", "% 7d"]
#
#   @rank_array = doc.css('td').css('.text-center').collect do |rank|
#     rank.text.strip
#   end
#   # Gives me an array of ranked numbers
#   #=> ["1", "2", "3","4"] etc.
#
#   @sym_array = doc.css('td').css('.currency-name').css('span a').collect do |sym|
#     sym.text.strip
#   end
#   # returns an array of coin symbols
#   #=> ["BTC", "XRP", "ETH", "BCH", "ADA", "XEM"]
#
#   @name_array = doc.css('td').css('.currency-name').css('.currency-name-container').collect do |name|
#     name.text
#   end
#   # returns an array of coin names
#   #=> ["Bitcoin", "Ripple", "Ethereum", "Bitcoin Cash", "Cardano", "NEM"]
#
#   @market_cap_array = doc.css('td').css('.market-cap').collect do |mc|
#     mc.text.strip
#   end
#
#   @price_array = doc.css('td').css('.price').collect do |price|
#     price.text.strip
#   end
#
#   @circulating_suppy_array = doc.css('td').css('.circulating-supply').collect do |supply|
#     no_space = supply.text.gsub(/\s+/, "")
#     no_space.gsub("*", " *")
#   end
#   # returns circulating supply with mineable asterisk
#
#   @day_trading_vol = doc.css('td').css('.volume').collect do |vol|
#     vol.text.strip
#   end
#
#   @hr_percent_change = doc.css('td').css('.percent-1h').collect do |h|
#     h.text.strip
#   end
#
#   @day_percent_change = doc.css('td').css('.percent-24h').collect do |day|
#     day.text.strip
#   end
#
#   @week_percent_change = doc.css('td').css('.percent-7d').collect do |week|
#     week.text.strip
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.create_coins # Make each Coin instance here
#     i = 0
#     while i < 10 do
#       coin_hash = {
#         :rank => @rank_array[i],
#         :name => @name_array[i],
#         :symbol => @sym_array[i],
#         :price => @price_array[i],
#         :supply => @circulating_suppy_array[i],
#         :market_cap => @market_cap_array[i],
#         :volume => @day_trading_vol[i],
#         :day_percent_change => @day_percent_change[i]
#       }
#       all << coin_hash
#       coin = Cryptie::Coin.new(coin_hash)
#       i += 1
#     end
#           # binding.pry
#   end
#
end
