require 'entry'
require 'json_source'

RSpec.describe JsonSource do
    it "parses entries from json" do
        json = '{"title":"Link 1","link":"https://www.links.com/1","date_created":1549054305}'
        entries = Entry.new( "Link 1", "https://www.links.com/1", 1549054305)
        sut = JsonSource.new(json)
        
        result = sut.entries

        expect(result).to match_array([entries])
    end
end