require_relative 'entries_repo'
require 'sinatra'
require "sinatra/reloader" if development?

puts "Sinatra: #{Process.pid}"

class Libraria < Sinatra::Base

  before do
    @repo = EntriesRepo.new
  end

  get "/" do
    content_type :json
    { rotation_time: 10 }.to_json
  end

end

run Libraria.run!