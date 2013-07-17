require_relative '../src/hello_world'
require 'test/unit'
require 'rack/test'

set :environment, :test

class RackTests < Test::Unit::TestCase

  def test_it_says_hello_world
    browser = Rack::Test::Session.new(Rack::MockSession.new(HelloWorld.new))
    browser.get '/'
    assert browser.last_response.ok?
    assert_equal 'Hello World', browser.last_response.body
  end

  def test_it_says_hello_to_a_person
    browser = Rack::Test::Session.new(Rack::MockSession.new(HelloWorld.new))
    browser.get '/', :name => 'Simon'
    assert browser.last_response.body.include?('Simon')
  end

  def test_sends_name_to_my_dependency
  	browser = Rack::Test::Session.new(Rack::MockSession.new(HelloWorld.new(self)))
    browser.get '/save_name', :name => 'Bob'  
    assert browser.last_response.ok?
  	assert_equal('bob', @name)
  end

  def set_name(name)
  	@name = name
  end

end