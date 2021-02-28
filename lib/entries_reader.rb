require 'json'

class EntriesReader
    attr_reader :entries

    def initialize(path)
        json_string = File.read(path)
        array = JSON.parse(json_string)
        @entries = array.map { |obj| Hash[obj.each_pair.to_a] }.to_json
    end
end