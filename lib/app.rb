require 'sinatra'
require "sinatra/reloader" if development?
require_relative 'entries_repository'

puts "Sinatra: #{Process.pid}"

ENTRIES_FILE = 'local_storage/entries.json'

class Libraria < Sinatra::Base

  before do
    @repo = EntriesRepository.new(ENTRIES_FILE)
  end

  get "/" do
    'This is just the root!'
  end

  get "/entries/all" do
    content_type :json
    @repo.all_entries
  end

  post '/entries' do
    @repo.add_entry(request.body.read)
  end
end

run Libraria.run!