require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get '/' do
  "Start to play"
end
