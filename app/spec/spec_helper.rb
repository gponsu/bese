require 'capybara/rspec'
require_relative '../application'

ENV['RACK_ENV'] = 'test'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|
  config.formatter = :documentation
end
