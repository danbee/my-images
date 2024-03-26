source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.5", ">= 7.0.5.1"

gem "dotenv-rails", groups: %i[development test]

gem "bootsnap", require: false
gem "delayed_job_active_record"
gem "dragonfly"
gem "http"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "jbuilder"
gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-github"
gem "pg"
gem "puma"
gem "sassc-rails"
gem "simple_form"
gem "stimulus-rails"
gem "turbo-rails"
gem "uglifier"

group :development do
  gem "web-console"
end

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry"
end

group :test do
  gem "capybara"
  gem "geckodriver-helper"
  gem "launchy"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webmock"
end
