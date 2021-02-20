require 'sinatra'
require "sinatra/reloader" if development?

puts "Sinatra: #{Process.pid}"

get '/' do
  content_type :json
  { rotation_time: 10 }.to_json
end