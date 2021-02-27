require 'entries_repo'
require 'entry'

RSpec.describe EntriesRepo do
    it "returns an empty list" do
        sut = EntriesRepo.new
        entries = [
            Entry.new('Link 1', 'https://www.links.com/1'),
            Entry.new('Link 2', 'https://www.links.com/2'),
        ]

        result = sut.all

        expect(result).to match_array(entries)
    end
end