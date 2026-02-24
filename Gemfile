source "https://rubygems.org"

gem "rails", "~> 8.1.2"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false

gem "slim-rails"
gem "simple_form"
gem "vimeo_ruby"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rspec-rails"
  gem "rails-controller-testing"
end

group :test do
  gem "factory_bot_rails"
  gem "shoulda-matchers"
  gem "faker"
end

group :development do
  gem "web-console"
end

gem 'ostruct' # since ruby 4.x