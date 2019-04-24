class Stack
   attr_reader :i
    def initialize
      @i = []
    end

    def push(el)
      @i << el
    end

    def pop
      @i.pop
    end

    def peek
      @i.first
    end
  end


  class Queue

    def initialize
        @line = []
    end

    def enqueue(el)
        @line << el
    end

    def dequeue
        @line.shift
    end

    def peek
        @line.first
    end

end


class Map_class
    attr_reader :mapper
    def initialize
        @mapper = []
    end

    def set(key, value)
        idx = nil
        self.mapper.each_with_index do |ele, i|
            idx = i if ele[0] == key
        end

        if idx == nil
            self.mapper << [key, value]
        else
            self.mapper[idx] = [key, value]
        end

    end

    def get(key)
        self.mapper.each do |ele|
            return ele[1] if ele[0] == key
        end
    end

    def delete(key)
        new_arr = self.mapper.reject do |ele|
            ele[0] == key
        end
        @mapper = new_arr
    end



end
  


