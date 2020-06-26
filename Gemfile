source 'https://rubygems.org'

ruby File.read('.ruby-version').chomp

# app server
gem 'bootsnap', require: false
gem 'rails'

# database
gem 'pg'

# webserver
gem 'puma'

# auth
gem 'devise'

# assets
gem 'autoprefixer-rails' # for bootstrap
gem 'bootstrap'
gem 'sassc-rails'
gem 'turbolinks'
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
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'i18n-debug'
end

group :development do
  gem 'listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# DDOS protection
gem 'rack-attack'

# windows development
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  # webserver
  gem 'rack-timeout'
end
