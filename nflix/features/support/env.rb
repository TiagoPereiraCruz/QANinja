require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'os'

require_relative 'helpers'

World(Helpers)

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'http://localhost:8080' # Docker ToolBox no Windows
  # config.app_host = "http://localhost:8080" # Docker no Mac, Linux ou Windows 10 Pro
  config.default_max_wait_time = 10
end