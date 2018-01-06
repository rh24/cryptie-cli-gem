require 'spec_helper'

# describe "Coin" do
#   let!(:coin_hash) {Coin.new({:rank => "1", :name => "Bitcoin", :symbol => "BTC"})}
#   # {:rank => "2", :name => "Ripple", :symbol => "XRP"}
#   # {:rank => "3", :name => "Ethereum", :symbol => "ETH"}
#
#   after(:each) do
#     Coin.class_variable_set(:@@all, [])
#   end
#
#   describe "#new" do
#     it "takes in an argument of a hash and sets each new coin's attributes using the key value pairs of its hash." do
#       expect{Coin.new(:coin_hash)}.to_not raise_error
#       expect(coin.name).to eq("Bitcoin")
#       expect(coin.symbol).to eq("BTC")
#       expect(coin.rank).to eq("1")
#     end
#   end
# end
