class EntriesRepo
    def initialize(source)
        @source = source
    end

    def all
        @source.entries
    end
end