source "https://rubygems.org"

ruby "2.4.0"

gem "autoprefixer-rails"
gem "bourbon", "5.0.0.beta.5"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem 'honeybadger', '~> 2.6', '>= 2.6.1'
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 4.2.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "sprockets", ">= 3.0.0"
gem "sprockets-es6"
gem "title"
gem "uglifier"

group :development do
  gem "quiet_assets"
  gem "refills"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4.0"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rails_stdout_logging"
  gem "rack-timeout"
end

## app specific
gem 'httparty', '~> 0.13.7' # grab the contents of a url
gem 'crack', '~> 0.4.3' # parse the xml or json of that page
gem 'foursquare2', '~> 2.0', '>= 2.0.2' #foursquare api
gem 'representable', '~> 3.0'
gem 'multi_json', '~> 1.12', '>= 1.12.1'
gem 'fuzzy_match', '~> 2.1' # best match strings
gem 'responders', '~> 2.2' #putting back responders into rails. Hey DHH, :P.
gem 'rails_12factor', '~> 0.0.3' # better heroku hosting 
