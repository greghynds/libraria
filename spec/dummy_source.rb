class DummySource
    attr_reader :entries

    def initialize
        @entries = [
            Entry.new('Link 1', 'https://www.links.com/1', 1549054305),
            Entry.new('Link 2', 'https://www.links.com/2', 1549054310),
        ]
    end

    def read
        @entries
    end
end