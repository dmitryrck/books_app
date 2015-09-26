source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.3'

gem 'googlebooks'
gem 'responders'
gem 'sidekiq'
gem 'simple_form'

gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'ffaker'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end
