require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  erb :index
end

post '/play' do
  @status = "Try again!"
  erb :index
end
