# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'administrate'
gem 'administrate-field-active_storage', '~> 0.4.2'
gem 'image_processing', '~> 1.12'

gem 'devise', '~> 4.9'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'rspec-rails', '~> 6.0'
  gem 'rubocop', '~> 1.40'
  gem 'rubocop-rails', '~> 2.17'
  gem 'rubocop-rspec', '~> 2.15'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.21.2'
end

group :test do
  gem 'capybara'
end

group :development do
  gem 'web-console'
end

gem 'pry'
gem 'pry-nav'
gem 'pry-remote'

gem 'racc', '1.6.1'

gem 'pundit', '~> 2.3'
