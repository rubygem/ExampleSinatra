require 'sinatra'

get '/' do
	"Hello World#{params[:name]}"
end