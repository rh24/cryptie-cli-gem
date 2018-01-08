require 'pry'

class Cryptie::Scraper
  @@all =[]

  def self.scrape_all_coins
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

    doc.css('table').css('tr').each do |coin|
        coin_hash = {
          :rank => coin.css('.text-center').text.strip,
          :name => coin.css('.currency-name').css('.currency-name-container').text.strip,
          :symbol => coin.css('.currency-name').css('span a').text.strip,
          :price => coin.css('td').css('.price').text.strip,
          :supply => coin.css('td').css('.circulating-supply').text.gsub(/\s+/, "").gsub("*", " *"),
          :market_cap => coin.css('td').css('.market-cap').text.strip,
          :volume => coin.css('td').css('.volume').text.strip,
          :day_percent_change => coin.css('td').css('.percent-24h').text.strip
        }

      coin = Cryptie::Coin.new(coin_hash) unless coin_hash[:rank].to_i == "#"
      @@all << coin_hash unless coin_hash[:rank].to_i == "#"
    end
  end

  def self.all
    @@all
  end
end
