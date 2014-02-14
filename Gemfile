source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.0.2'

# make http requests
gem 'typhoeus'

# postgres db
gem 'pg'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

group :production do
  gem 'rails_12factor'
end

# tools used in development
group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'annotate'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'guard-rspec'
  gem 'guard-livereload'

  gem 'database_cleaner'
  gem 'launchy'

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i

  gem 'dotenv-rails'
  
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'awesome_print' 
end

group :doc do
  gem 'sdoc', require: false
end
