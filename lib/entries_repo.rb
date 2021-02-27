class EntriesRepo
    def all
        [
            Entry.new('Link 1', 'https://www.links.com/1'),
            Entry.new('Link 2', 'https://www.links.com/2'),
        ]
    end
end