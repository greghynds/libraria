require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'entries_reader'
require_relative 'entries_writer'

puts "Sinatra: #{Process.pid}"

ENTRIES_FILE = 'local_storage/entries.json'

class Libraria < Sinatra::Base

  before do
    @reader = EntriesReader.new(ENTRIES_FILE)
    @writer = EntriesWriter.new(ENTRIES_FILE)
  end

  get "/" do
    'This is just the root!'
  end

  get "/entries/all" do
    content_type :json
    @reader.entries
  end

  post '/entries' do
    @writer.write(request.body.read)
  end
end

run Libraria.run!