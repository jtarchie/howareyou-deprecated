source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'devise'
gem 'devise_invitable', '~> 1.3.4'
gem 'haml-rails'
gem 'high_voltage'
gem 'pg'
gem 'puma'
gem 'rails', '4.1.1'
gem 'rails-assets-bootstrap'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'uglifier'

group :test do
  gem 'capybara-webkit'
  gem 'pry'
  gem 'pry-byebug'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'better_errors'
  gem 'rspec-rails'
end

group :development do
  gem 'letter_opener'
  gem 'spring'
end

group :production do
  gem 'postmark-rails', '~> 0.8.0'
  gem 'rails_12factor'
end

ruby '2.1.2'
