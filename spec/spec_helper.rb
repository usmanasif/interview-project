# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'factory_bot'
require "sinatra/activerecord"
require 'database_cleaner'
require "shoulda/matchers"

require File.expand_path '../../app.rb', __FILE__

FactoryBot.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryBot.find_definitions

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# For RSpec 2.x
RSpec.configure do |config|
  config.include RSpecMixin

  config.formatter = :documentation
  config.tty = true
  config.color = true

  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include(Shoulda::Matchers::ActiveModel, type: :model)

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
end
