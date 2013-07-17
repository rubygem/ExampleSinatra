require 'sinatra'

class HelloWorld < Sinatra::Base

	def initialize(bob=Bob.new)
		super
		@bob = bob
	end

	get '/' do
		"Hello World#{params[:name]}"
	end

	get '/save_name' do
		@bob.set_name('bob')
	end
end

class Bob

end