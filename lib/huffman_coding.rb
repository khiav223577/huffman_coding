require 'huffman_coding/version'

class << HuffmanCoding
  def encode(input_array, frequencies = input_array.tally)
    if frequencies.size == 1
      code_table = { frequencies.keys[0] => '0' }
    else
      code_table = {}
      build_tree(frequencies).traverse('', code_table)
    end

    result_binary_string = input_array.map{|char| code_table[char] }.join
    last_byte_bits = result_binary_string.size % 8
    binary = result_binary_string.scan(/.{1,8}/).map{|s| s.to_i(2) }.pack('C*')
    return binary, last_byte_bits, code_table
  end

  def decode(binary, last_byte_bits, code_table)
    text = ''
    code_table = code_table.invert
    previous = ''

    add_binary_char = proc do |binary_char|
      previous << binary_char
      if (char = code_table[previous])
        text << char
        previous = ''
      end
    end

    bytes = binary.bytes.map{|s| s.to_s(2) } # bytes = ['101000', '11', '10101111', ...]
    last_byte = bytes.pop

    bytes.each do |byte|
      (8 - byte.size).times{ add_binary_char['0'] }
      byte.each_char{|s| add_binary_char[s] }
    end

    (last_byte_bits - last_byte.size).times{ add_binary_char['0'] }
    last_byte.each_char{|s| add_binary_char[s] }

    return text
  end

  private

  def build_tree(frequencies)
    level_nodes = LevelNodes.new(frequencies.map{|letter, frequency| Node.new(letter, frequency) })

    while level_nodes.size > 1 do
      left_level, left_node = level_nodes.pop_min_node
      right_level, right_node = level_nodes.pop_min_node
      next_level = (left_level > right_level ? left_level : right_level) + 1

      new_node = Node.new(nil, left_node.weight + right_node.weight, left_node, right_node)
      level_nodes.push_node(next_level, new_node)
    end

    return new_node
  end
end
