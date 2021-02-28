require 'json'

class JsonSource
    def initialize(json_string)
        @json = JSON.parse(json_string)
    end

    def entries
        entries = @json.map do |hash|
            parse_entry(hash)
        end
    end

    def parse_entry(hash)
        Entry.new(
            hash['title'],
            hash['link'], 
            hash['date_created']
        )
    end
end