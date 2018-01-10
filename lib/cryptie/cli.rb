require 'pry'

class Cryptie::CLI
  attr_reader :person

  def call
    Cryptie::Scraper.scrape_all_coins
    Cryptie::Coin.list
    greeting
    menu
  end

  def greeting
    puts "\n--------------------- Which coin would you like to learn more about? ------------------------"
    puts "-------------------- Enter rank \#, \"list\" to see top coins, or \"exit\" -----------------------"
    puts "------ NOTE: If you'd prefer to search all coins by your token's symbol, type \"symbol\" ------"
    puts "--------- If you'd like to go straight to ordering, enter \"order\" to get started. ------------"
  end

  def return_menu
    puts "Welcome back! Enter \"list\",   rank #,   \"symbol\",   \"order\" (for new accounts),
    \"buy more\" (to continue purchasing),  or \"exit\" to quit."
    menu
  end

  def menu
    input = nil
    while input != "exit"
      input = gets.strip.downcase # Need to sanitize the input later
      if input.to_i != 0
        coin = Cryptie::Coin.find_by_rank(input)
        print_info(coin)
        puts "\nWould you like to place an order? Enter \"order\" to get started or \"menu\" for more options."
      elsif input == "symbol"
        puts "---------------- SEARCH BY SYMBOL: ---------------- \nWhen finished, enter \"menu\" for more options."
        symbol
      elsif input == "list"
        # If I switch to list, person is not saved
        Cryptie::Coin.list
        puts "\nWould you like to place an order? Enter \"order\" to get started or \"menu\" for more options."
      elsif input == "order"
        @person = Cryptie::Person.new(person_name, balance) # I don't want to create a new person every time.
        person.order
        person.display_account
        puts "--- Enter \"buy more\" to make another purchase, \"menu\" for more options, or \"exit\" to quit.---"
        puts "------- NOTE: If you already know your token symbol, simply type it into your order. --------"
        puts "------- The CLI only displays the Top 20 coins, but all token info has been scraped. --------"
        puts "------------------------- Check to see if we have your coin! --------------------------------"
      elsif input == "buy more"
        buy_more
      elsif input == "exit"
        goodbye
      elsif input == "menu" # If menu is explicitly called again, then re-print greeting.
        return_menu
      else
        puts "Not sure what you want. Try again, or enter \"exit\" to leave:"
      end
    end
  end

  def symbol
    puts "Input your token's symbol:"
    input = gets.strip.upcase
    coin = Cryptie::Coin.find_by_symbol(input)
    if coin == nil
      puts "Sorry, we couldn't find your token. Enter valid input or \"menu\" for more options"
      input.downcase == "menu" ? return_menu : symbol
    else
      print_info(coin)
    end
  end

  def buy_more
    if person == nil
      puts "Create an account first. Enter \"order\" to get started."
      menu
    elsif person.spending_balance <= 0
      puts "You're out of money! Would you like to continue purchasing? (y/n)"
      answer = gets.strip.downcase
      if answer == "yes" || answer == "y"
        balance
        person.spending_balance = balance
      elsif answer == "no" || answer == "n"
        greeting
        menu
      else
        invalid
        buy_more
      end
    else
      person.order
      person.display_account
      puts "-- Enter \"buy more\" to make another purchase, \"menu\" for more options, or \"exit\" to quit. --"
      puts "----------- Once you enter \"list\" or \"exit\" your information will not be saved -------------"
    end
  end

  def print_info(coin)
    puts "\nYou've entered ##{coin.rank}:"
    puts "\nName: #{coin.name}"
    puts "Symbol: #{coin.symbol}"
    puts "Price: #{coin.price}"
    puts "Circulating Supply: #{coin.supply}"
    puts "Market Cap: #{coin.market_cap}"
    puts "1h Change: #{coin.hr_percent_change}"
    puts "24h Change: #{coin.day_percent_change}"
    puts "7d Change: #{coin.week_percent_change}"
  end

  def person_name
    puts "Please, enter your name:"
    input = gets.strip
    if input == "exit"
      goodbye
      exit
    elsif input == "menu"
      return_menu
    elsif input.to_i.is_a?(Integer) && input.to_i != 0
      puts "Need valid name. Try again, \"exit\" or \"menu\" for more options."
      person_name
    else
      input
    end
  end

  def balance
    puts "Please, enter your spending balance:"
    input = gets.strip
    input = input.delete("$") if input.include?("$")
    if input == "exit"
      goodbye
      exit
    elsif input.downcase == "menu"
      menu
    elsif input.to_i <= 0
      puts "You have no money to spend. Please, enter valid balance, \"exit\", or type \"menu\" for more options."
      balance
    else
      input.to_i
    end
  end

  def invalid
    puts "Invalid input. Please, try again."
    # return_menu
  end

  def goodbye
    puts "See you later! Check back again soon. Crypto moves quickly."
    exit
  end

end
