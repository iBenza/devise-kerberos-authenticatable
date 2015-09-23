ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require "rails_app/config/environment"
require 'rspec/rails'
require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
