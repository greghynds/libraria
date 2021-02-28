require 'json'

class EntriesRepository
    def initialize(path)
        @path = path
    end

    def all_entries
        json_string = File.read(@path)
        array = JSON.parse(json_string)
        array.map { |obj| Hash[obj.each_pair.to_a] }.to_json
    end

    def add_entry(json_string)
        raw = File.read(@path)
        saved = JSON.parse(raw)
        entry = JSON.parse(json_string)

        File.open(@path, "w") do |f|
            f.puts JSON.pretty_generate(saved << entry)
        end 
    end
end