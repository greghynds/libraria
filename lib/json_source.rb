require 'json'

class JsonSource
    def initialize(json_string)
        @json = JSON.parse(json_string)
    end

    def entries
        entries = @json.map do |entry|
            parse_entry(entry)
        end
    end

    def parse_entry(entry)
        Entry.new(
            entry['title'],
            entry['link'], 
            entry['date_created']
        )
    end
end