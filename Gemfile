# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Postgresql
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Manage Procfile-based applications
# https://github.com/ddollar/foreman
gem 'foreman', '~> 0.63'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Requiring the ruby-kafka frim trunk is Necessary in ruby 2.7.0 until they release
# a version that includes https://github.com/zendesk/ruby-kafka/commit/9f35ac
gem 'ruby-kafka', git: 'https://github.com/zendesk/ruby-kafka.git'
gem 'karafka', '~> 1.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# From common

