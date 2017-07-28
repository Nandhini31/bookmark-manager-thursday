ENV['RACK_ENV'] = "test"

require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'database_cleaner'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../app/app.rb'

Capybara.app = BookmarkManager

RSpec.configure do |config|

  DataMapper.setup(:default,'postgres://localhost/bookmark_manager_test')
  DataMapper.finalize

  config.before(:suite)do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
