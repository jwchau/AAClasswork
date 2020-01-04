class PolyTreeNode

    attr_reader :children, :value, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        parent.children.delete(self) if parent
        @parent = node
        if !node.nil?
            node.children.push(self) if !node.children.include?(self)
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise "error" unless self.children.include?(child)
    end

    #dfs uses stack
    def dfs(target)
        return self if value == target
        children.each do |child|
            check = child.dfs(target)
            return check unless check.nil?
        end
        nil
    end

    #bfs uses queue
    def bfs(target)
        queue = [self]
        until queue.empty?
            root = queue.pop
            return root if root.value == target
            root.children.each { |child| queue.unshift(child) }
        end
        nil
    end

    def print_tree
        queue = [self]
        until queue.empty?
            root = queue.pop
            print root.value
            print " => "
            root.children.each do |child| 
                queue.unshift(child) 
                print child.value
            end
            puts ""
        end
        nil
    end

    #go through every node
        #print it's children, queue children
        #repeat

    def inspect
        value
    end

end

# node = PolyTreeNode.new(0)
# PolyTreeNode.new(1).parent = node
# PolyTreeNode.new(2).parent = node
# PolyTreeNode.new(3).parent = node.children[0]
# PolyTreeNode.new(4).parent = node.children[0]
# PolyTreeNode.new(5).parent = node.children[1]
# PolyTreeNode.new(6).parent = node.children[1]