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

  get "/entries/all" do
    content_type :json
    @repo.all.map { |o| Hash[o.each_pair.to_a] }.to_json
  end

  post '/entries' do
    json = JSON.parse(request.body.read)
    stored = File.read(ENTRIES_FILE)

    File.open(ENTRIES_FILE,"w") do |f|
      f.puts JSON.generate(JSON.parse(stored) << json)
    end 

    puts "Saving #{json}"
  end
end

run Libraria.run!