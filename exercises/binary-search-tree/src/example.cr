class Node(T)
  include Enumerable(T)
  include Iterable(T)

  property value : T
  property left : Node(T)?
  property right : Node(T)?

  def initialize(@value : Comparable)
  end

  def insert(new_value)
    if new_value <= value
      if (node = left)
        node.insert(new_value)
      else
        @left = Node(T).new(new_value)
      end
    else
      if (node = right)
        node.insert(new_value)
      else
        @right = Node(T).new(new_value)
      end
    end
  end

  def search(search_value)
    return self if search_value == value
    if search_value < value
      if (node = left)
        node.search(search_value)
      end
    else
      if (node = right)
        node.search(search_value)
      end
    end
  end

  def each
    TreeIterator.new(self).each do |v|
      yield v
    end
  end

  def each
    TreeIterator.new(self)
  end

  private def process_left(node, stack)
    while node
      stack.push(node)
      node = node.left
    end
  end

  private class TreeIterator(T)
    include Iterator(T)

    def initialize(node : Node(T))
      @stack = Array(Node(T)).new
      process_left(node)
    end

    def next
      return stop if @stack.empty?

      node = @stack.pop
      right = node.right
      if right
        process_left(right)
      end
      node.value
    end

    private def process_left(node)
      while node
        @stack.push(node)
        node = node.left
      end
    end
  end
end
