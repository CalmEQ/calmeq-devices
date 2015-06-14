# some code coverage
# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

# better code coverage
require 'coveralls'
Coveralls.wear!('rails')

# real world testing
require 'capybara/rails'

# xserver headless (for webhook driver)
# require 'headless'

# real world testing
require 'selenium-webdriver'

# template code  
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # set the javascript driver - when we need to test javascript
  # Capybara.javascript_driver = :webkit
  # Capybara.default_driver = :selenium
  # Capybara.default_driver = :webkit
  
end
