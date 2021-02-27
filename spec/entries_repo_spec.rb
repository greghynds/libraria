require 'entries_repo'

RSpec.describe EntriesRepo do
    it "returns an empty list" do
        sut = EntriesRepo.new

        result = sut.all

        expect(result).to eq []
    end
end