# Load the Rails application.
puts "=[ENVIRONMENT/PRE-REQ_REL]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
require_relative 'application'

puts "=[ENVIRONMENT/POST-REQ_REL]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
# Initialize the Rails application.
Rails.application.initialize!
puts "=[ENVIRONMENT/POST-APP-INIT]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
