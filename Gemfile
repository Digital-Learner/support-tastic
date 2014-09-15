source 'https://rubygems.org'


gem 'rails', '4.1.5'
gem 'pg'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'foundation-rails'
gem 'foundation_rails_helper'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'capistrano-rails', group: :development

gem 'debugger', group: [:development, :test]

gem 'thin'

group :development do
  gem 'guard-cucumber'
  gem 'guard-rspec', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'gmail', git: 'https://github.com/90seconds/gmail.git'
end

group :test do
  gem 'factory_girl_rails', '>= 4.4.0'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'email_spec'
  gem 'quiet_assets', group: :development
end
