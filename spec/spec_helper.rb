require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'

driver =  ENV['DRIVER'] ? ENV['DRIVER'].to_sym : :poltergeist

Capybara.configure do |config|
  config.default_driver = driver
  config.javascript_driver = driver
  config.run_server = false
end
