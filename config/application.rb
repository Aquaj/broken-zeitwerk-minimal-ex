puts "=[APPLICATION/PRE-REQ_REL]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
require_relative 'boot'

puts "=[APPLICATION/PRE-REQ]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

puts "=[APPLICATION/PRE-BUNDLER]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
p Bundler.method(:require).source_location
Bundler.require(*Rails.groups)
puts "=[APPLICATION/POST-BUNDLER]= #{Bundler.instance_variable_get(:@setup).nil?.inspect}"

module BrokenZeitwerkMinimalEx
  class Application < Rails::Application
    config.load_defaults 6.0

    config.autoloader = :zeitwerk

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
