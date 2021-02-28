require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'entries_repo'
require_relative 'entry'
require_relative 'json_source'

puts "Sinatra: #{Process.pid}"

ENTRIES_FILE = 'local_storage/entries.json'

class Libraria < Sinatra::Base

  before do
    source = JsonSource.new(File.read(ENTRIES_FILE))
    @repo = EntriesRepo.new(source)
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