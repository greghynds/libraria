class EntriesRepo
    def initialize(source)
        @source = source
    end

    def all
        @source.read
    end
end