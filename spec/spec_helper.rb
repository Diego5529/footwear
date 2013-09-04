ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require "digest/sha1"
require 'factory_girl_rails'
require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  Capybara.javascript_driver = :webkit
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include SpecTestHelper, :type => :controller
  config.include SpecTestHelper, :type => :request  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end
