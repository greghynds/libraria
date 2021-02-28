require 'entry'
require 'json_source'
require 'dummy_source'

RSpec.describe JsonSource do
    it "parses entries from json" do
        json = '[{"title":"Link 1","link":"https://www.links.com/1","date_created":1549054305},{"title":"Link 2","link":"https://www.links.com/2","date_created":1549054310}]'
        sut = JsonSource.new(json)
        
        result = sut.entries

        expect(result).to match_array(DummySource.new.entries)
    end
end