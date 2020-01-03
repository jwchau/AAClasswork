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

    def inspect
        value
    end

end