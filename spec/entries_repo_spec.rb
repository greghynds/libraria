require 'entries_repo'
require 'entry'

RSpec.describe EntriesRepo do
    it "returns all entries" do
        source = DummySource.new
        sut = EntriesRepo.new(source)
        
        result = sut.all

        expect(result).to match_array(source.entries)
    end
end

class DummySource
    attr_reader :entries

    def initialize
        @entries = [
            Entry.new('Link 1', 'https://www.links.com/1', 1549054305),
            Entry.new('Link 2', 'https://www.links.com/2', 1549054310),
            Entry.new('Link 3', 'https://www.links.com/3', 1549054325),
        ]
    end
end