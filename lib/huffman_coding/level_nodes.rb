class LevelNodes
  attr_reader :size

  def initialize(nodes)
    @hash = Hash.new{|h, k| h[k] = [] }
    @hash[0] = nodes.sort
    @size = nodes.size
  end

  def pop_min_node
    level, nodes = @hash.min_by{|_, v| v[0] }
    node = nodes.shift
    @hash.delete(level) if nodes.size == 0
    @size -= 1
    return level, node
  end

  def push_node(level, node)
    @hash[level] << node
    @hash[level].sort!
    @size += 1
  end

  def size
    @size
  end
end
