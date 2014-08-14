source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.0'
gem 'unicorn', require: false # Use unicorn as the app server
gem 'pg'
gem 'uglifier'
gem 'therubyracer'
gem 'bcrypt-ruby'
gem 'dalli'
gem 'sass-rails'
gem 'pry'
gem 'bourbon'
gem 'neat'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'active_model_serializers'
gem "email_validator"
gem 'recipient_interceptor'
gem 'delayed_job_active_record'



group :development do
  gem 'growl'
  gem 'guard'
  gem 'guard-rspec'
  gem 'bitters'
end

group :test do
  gem 'rspec-rails', '~> 2.10'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'rake'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', require: false
end

# Heroku
group :production do
  gem 'rails_12factor'
  gem 'memcachier'
end