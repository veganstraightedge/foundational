source 'https://rubygems.org'

ruby file: '.ruby-version'

# app server
gem 'bootsnap', require: false
gem 'rack-timeout', group: :production
gem 'rails'

# database
gem 'pg'

# webserver
gem 'puma'

# assets
gem 'bootstrap-icons-helper'
gem 'importmap-rails'
gem 'propshaft'
gem 'stimulus-rails'
gem 'turbo-rails'

# pagination
gem 'kaminari'

# JSON views
gem 'jbuilder'

# text utilities
gem 'kramdown' # for markdown
gem 'sterile'  # for slugs

# observability
gem 'lograge'
gem 'logstash-event'

# uploads using Active Storage
gem 'aws-sdk-s3', require: false
gem 'image_processing'

# gem 'azure-storage',        require: false # uncomment if using this or mirror
# gem 'google-cloud-storage', require: false # uncomment if using this or mirror

# background jobs and cache in the database
gem 'solid_cache'
gem 'solid_queue'

# environment variables
gem 'dotenv-rails'

# network utilities
gem 'down'
gem 'http'

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  # CI code checks
  gem 'brakeman',         require: false # security static analysis
  gem 'erb_lint',         require: false # linter
  gem 'rubocop',          require: false # linter
  gem 'rubocop-capybara', require: false # linter
  gem 'rubocop-rails',    require: false # linter
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :production do
  # DDOS protection
  gem 'rack-attack'
end

# windows development
gem 'tzinfo-data', platforms: %i[windows jruby]

gem "bcrypt", "~> 3.1"
