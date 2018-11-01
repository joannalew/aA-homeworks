  class LRUCache
    attr_reader :cache

    def initialize(size=10)
      @cache = Array.new(size)
      @index = 0
    end

    def count
      return @index
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        i = @cache.find_index(el)
        while i < @index - 1
          @cache[i], @cache[i + 1] = @cache[i + 1], @cache[i]
          i += 1
        end
      elsif @index < @cache.length
        @cache[@index] = el
        @index += 1
      else
        @cache.length.times { |i| @cache[i] = @cache[i+1] }
        @cache[-1] = el
      end
    end

    def show
      if @index == @cache.length
        p @cache
        return 
      end

      i = 0
      res = []
      while i < @index
        res << @cache[i]
        i += 1
      end
      p res
    end


  end
