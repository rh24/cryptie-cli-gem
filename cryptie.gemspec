require_relative './lib/cryptie/version'

Gem::Specification.new do |s|
  s.name        = 'cryptie'
  s.version     = Cryptie::VERSION
  s.date        = '2018-01-06'
  s.summary     = " "
  s.description = " "
  s.authors     = ["Rebecca Hong"]
  s.email       = 'ms.rebeccahong@gmail.com'
  s.files       = ["lib/cryptie.rb", "lib/cryptie/cli.rb", "lib/cryptie/scraper.rb", "lib/cyrptie/coin.rb", "config/environment.rb"]
  s.homepage    = ''
  s.license     = 'MIT'
  s.executables << 'cryptie'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
