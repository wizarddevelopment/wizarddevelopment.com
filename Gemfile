source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jbuilder', '~> 1.2' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# =>  Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
gem 'unicorn', require: false

group :development do
  gem 'growl'
  gem "guard"
  gem "guard-rspec"
end

group :test do
  gem "rspec-rails", "~> 2.10"
  gem "factory_girl_rails"
  gem 'fuubar'
end

group :staging, :production do
  gem 'rails_12factor'
end