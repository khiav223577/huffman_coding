require 'huffman_coding/utils'

class << HuffmanCoding::Utils
  if Enumerable.method_defined?(:tally)
    def tally(array)
      array.tally
    end
  else
    def tally(enumerable)
      hash = Hash.new(0)
      enumerable.each{|key| hash[key] += 1 }
      return hash
    end
  end
end
