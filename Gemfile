source 'https://rubygems.org'

ruby File.read('.ruby-version').chomp

# app server
gem 'rails'
gem 'bootsnap', require: false

# database
gem 'pg'

# webserver
gem 'puma'

# auth
gem 'devise'

# assets
gem 'bootstrap'
gem 'jquery-rails' # for bootstrap pages
gem 'sassc-rails'
gem 'webpacker'

# JSON views
gem 'jbuilder'

# pagination
gem 'kaminari'

# MISC
gem 'sterile' # for slugs

# admin
gem 'administrate'

# observability
gem 'lograge'
gem 'logstash-event'

# Active Storage uploads
gem 'image_processing'

# environment variables
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'i18n-debug'
end

group :development do
  gem 'web-console'
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# DDOS protection
gem 'rack-attack'

# windows development
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  # webserver
  gem 'rack-timeout'
end
