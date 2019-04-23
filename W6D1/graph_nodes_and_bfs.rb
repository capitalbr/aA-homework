require 'set'
class GraphNode
    attr_accessor :val, :neighbors, :visited, :test
    def initialize(val)
        self.val = val
        self.neighbors = []
        self.test = nil
        #@visited = Set.new
    end


    def self.bfs(starting_node, target_value)
        
        # puts node.val
        arr = [starting_node]
        visited = Set[]
            until arr.empty?
                first = arr.shift
                begin                                   # with (omni?) bidirectional neighbor maps node A can have a child B who has a child C who has a child A!
                    if visited.include?(first)          # so if visited include 'first' then we are revisiting ones we have already been to before and will search
                        raise                           # the same way through them again until we are here again and it will never end.
                    else                                # begin/rescue wasn't necessary because I'm not continuing the program it was just for practice.
                        visited << first
                    end
                rescue
                    return nil
                end
                return first.test if first.val == target_value
                first.neighbors.each { |ele| arr << ele }
                # return nil if el.neighbors.all? { |ele| visited.include?(ele) }
            end
        
        nil
    end



end

a = GraphNode.new("a")
b = GraphNode.new("b")
c = GraphNode.new("c")
d = GraphNode.new("d")
e = GraphNode.new("e")
f = GraphNode.new("f")
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

b.test = "I am the b you found me"
p GraphNode.bfs(a, "f")