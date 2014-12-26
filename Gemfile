source 'https://rubygems.org'

ruby '2.2.0'

gem 'active_model_serializers'
gem 'aws-sdk'
gem 'bcrypt'
gem 'bourbon'
gem 'dalli'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'feedjira'
gem 'figaro'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'neat'
gem 'nokogiri'
gem 'paperclip'
gem 'pg'
gem 'pry'
gem 'rails', '4.2.0'
gem 'recipient_interceptor'
gem 'redcarpet'
gem 'sass-rails'
gem 'therubyracer'
gem 'uglifier'
gem 'unicorn', require: false # Use unicorn as the app server

group :development do
  gem 'bitters'
  gem 'growl'
  gem 'guard'
  gem 'guard-rspec'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'rake'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'rubocop', require: false
end

# Heroku
group :production, :stagins do
  gem 'memcachier'
  gem 'rails_12factor'
end
