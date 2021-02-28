require 'json'

class EntriesWriter
    def initialize(path)
        @path = path
    end

    def write(json_string)
        raw = File.read(@path)
        saved = JSON.parse(raw)
        entry = JSON.parse(json_string)

        File.open(@path, "w") do |f|
            f.puts JSON.pretty_generate(saved << entry)
        end 

        puts "Adding new entry:\n #{entry}"
    end
end