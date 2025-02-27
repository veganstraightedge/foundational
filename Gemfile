source 'https://rubygems.org'

ruby file: '.ruby-version'

# app server
gem 'rails'
gem 'bootsnap', require: false
gem 'rack-timeout', group: :production

# database
gem 'pg'

# webserver
gem 'puma'


# auth
gem 'cancancan'
gem 'devise'
gem 'rolify'

# assets
gem 'propshaft'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
# TODO: TBD as a part of assets
# gem 'autoprefixer-rails' # for bootstrap
# gem 'bootstrap'
# gem 'sassc-rails'

# JSON views
gem 'jbuilder'

# text utilities
gem 'kramdown' # for markdown
gem 'sterile'  # for slugs

# TODO: TBD
# admin
# gem 'administrate'
# https://administrate-demo.herokuapp.com

# observability
gem 'lograge'
gem 'logstash-event'

# uploads using Active Storage
gem 'aws-sdk-s3',           require: false
gem 'azure-storage',        require: false
gem 'google-cloud-storage', require: false
gem 'image_processing'

# background jobs and cache in the database
gem 'solid_cache'
gem 'solid_queue'

group :development, :test do
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'

  gem 'brakeman', require: false # security static analysis
  gem 'rubocop',  require: false # linter
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
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
