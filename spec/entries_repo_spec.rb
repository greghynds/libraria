require 'entries_repo'
require 'entry'
require 'dummy_source'

RSpec.describe EntriesRepo do
    it "returns all entries" do
        source = DummySource.new
        sut = EntriesRepo.new(source)
        
        result = sut.all

        expect(result).to match_array(source.entries)
    end
end