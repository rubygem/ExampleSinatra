require_relative '../src/hello_world'
require 'test/unit'
require 'rack/test'

set :environment, :test

class RackTests < Test::Unit::TestCase

  def test_it_says_hello_world
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/'
    assert browser.last_response.ok?
    assert_equal 'Hello World', browser.last_response.body
  end

  def test_it_says_hello_to_a_person
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/', :name => 'Simon'
    assert browser.last_response.body.include?('Simon')
  end
end

class HelloWorldTest < Test::Unit::TestCase
	require 'capybara'
	require 'capybara/dsl'

	include Capybara::DSL
	# Capybara.default_driver = :selenium # <-- use Selenium driver

	def setup
		Capybara.app = Sinatra::Application.new
	end

	def test_it_works
		visit '/'
		assert page.has_content?('Hello World')
	end
end