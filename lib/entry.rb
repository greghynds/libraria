class Entry
    attr_reader :title
    attr_reader :link
    
    def initialize(title, link)
        @title = title
        @link = link
    end

    def ==(o)
        o.class == self.class && o.state == state
      end
    
      protected
    
      def state
        [@title, @link]
      end
end