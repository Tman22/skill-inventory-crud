ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/skill_inventory_test.sqlite3")}].strategy = :truncation

class Minitest::Test
  def setup
    DatabaseCleaner.start
  end
  
  def teardown
    DatabaseCleaner.clean
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
