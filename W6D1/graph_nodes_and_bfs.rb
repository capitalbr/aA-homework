class GraphNode
    attr_accessor :val, :neighbors, :visited
    def initialize(val)
        self.val = val
        self.neighbors = []
        # @visited = Set.new
    end


    def self.bfs(starting_node, target_value)
        # puts node.val
        arr = [starting_node]
        # visited = Set.new
        # visited << starting_node
            until arr.empty?
                el = arr.shift
                # visited << el
                return el.val if el.val == target_value
                el.neighbors.each { |ele| arr << ele }
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
c.neighbors = [b, c]
e.neighbors = [a]
f.neighbors = [e]

p GraphNode.bfs(a, "b")