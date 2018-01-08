require 'spec_helper'

describe "Cryptie::Coin" do
  let!(:coin_hash) {{:rank => "1", :name => "Bitcoin", :symbol => "BTC"}}
  # {:rank => "2", :name => "Ripple", :symbol => "XRP"}
  # {:rank => "3", :name => "Ethereum", :symbol => "ETH"}

  describe "#new" do
    it "takes in an argument of a hash and sets each new coin's attributes using the key value pairs of its hash." do
      expect{Cryptie::Coin.new(coin_hash)}.to_not raise_error
      coin = Cryptie::Coin.new(coin_hash)
      expect(coin.name).to eq("Bitcoin")
      expect(coin.symbol).to eq("BTC")
      expect(coin.rank).to eq("1")
    end
  end
end
