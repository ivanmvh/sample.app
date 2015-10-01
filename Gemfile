source 'http://rubygems.org'
ruby "1.9.3"
gem 'rails', '3.2.3'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
# añadido para usar pg 
#gem 'pg', '0.12.2'
group :development do
  gem 'annotate', '>=2.4.1.beta'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test, :development do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.10.0'
  gem 'factory_girl_rails', '1.4.0'
end

group :test do
  gem 'faker', '1.0.1'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-spork', '0.3.2'
  #gem 'guard-spork', :github => 'guard/guard-spork'
  #gem 'guard-spork', '>=1'
  gem 'spork', '0.9.0'
  #gem 'spork', '>= 0.9.0'
  gem 'capybara', '1.1.2'
  gem 'cucumber-rails', '1.2.1', require: false
  gem 'database_cleaner', '0.7.0'
  # añadidos sec 3.6 advanced setup
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.2'  
  gem 'wdm'
  gem 'launchy'
end

group :production do
  gem 'pg', '0.12.2'
end