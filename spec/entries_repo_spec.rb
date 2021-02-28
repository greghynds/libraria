require 'entries_repo'
require 'entry'

RSpec.describe EntriesRepo do
    it "returns all entries" do
        sut = EntriesRepo.new
        entries = [
            Entry.new('Link 1', 'https://www.links.com/1', 1549054305),
            Entry.new('Link 2', 'https://www.links.com/2', 1549054310),
        ]

        result = sut.all

        expect(result).to match_array(entries)
    end
end