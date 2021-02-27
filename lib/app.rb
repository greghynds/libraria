require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'entries_repo'
require_relative 'entry'

puts "Sinatra: #{Process.pid}"

class Libraria < Sinatra::Base

  before do
    @repo = EntriesRepo.new
  end

  get "/" do
    'This is just the root!'
  end

  get "/all" do
    content_type :json
    @repo.all.map { |o| Hash[o.each_pair.to_a] }.to_json
  end
end

run Libraria.run!