require 'sinatra'

class HelloWorld < Sinatra::Base

	get '/' do
		"Hello World#{params[:name]}"
	end

end