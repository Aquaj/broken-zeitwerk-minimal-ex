ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

puts "=[BOOT/PRE-REQ_BUNDLER]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
require 'bundler/setup' # Set up gems listed in the Gemfile.
puts "=[BOOT/POST-REQ_BUNDLER]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
puts "=[BOOT/POST-REQ_BOOTSNAP]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
