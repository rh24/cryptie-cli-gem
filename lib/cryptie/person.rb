class Cryptie::Person
  attr_accessor :name, :account
  attr_reader :orders, :coins

  def intialize(name, account_balance)

  end

  def order_name
    puts "Please, enter your name:"
    name = gets.strip
    if name.to_i != 0
      puts "Need valid input. Try again."
      order_name

end
