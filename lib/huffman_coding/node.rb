class Node
  attr_reader :weight

  def initialize(value, weight, left = nil, right = nil)
    @value = value
    @weight = weight
    @left = left
    @right = right
    @leaf = (@left == nil && @right == nil)
  end

  def traverse(code, hash)
    if @leaf
      hash[@value] = code
    else
      @left.traverse("#{code}1", hash)
      @right.traverse("#{code}0", hash)
    end
  end

  def <=>(other)
    @weight <=> other.weight
  end
end
