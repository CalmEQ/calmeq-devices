# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Add loging with logentries for heduko
Rails.logger = Le.new('fb07f06c-69f9-4a5e-8269-443bb1188dc9', :debug => true, :local => true)