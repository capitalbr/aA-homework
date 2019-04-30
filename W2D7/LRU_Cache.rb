 class LRUCache
    def initialize(size)
        @size = size
        @cache = cache
    end

    def count
      @cache.count
    end

    def add(ele)
        if @cache.include?(ele)
            @cache.delete(ele)
            @cache << ele
        elsif count >= size
            @cache.shift
            @cache << ele
        else
            @cache << ele
        end
      # adds element to cache according to LRU principle
    end

    def show
        puts @cache
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end
