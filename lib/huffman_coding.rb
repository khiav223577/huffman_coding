# frozen_string_literal: true

require 'huffman_coding/version'
require 'huffman_coding/level_nodes'
require 'huffman_coding/node'
require 'huffman_coding/utils/tally'

class HuffmanCoding
  attr_reader :binary
  attr_reader :last_byte_bits
  attr_reader :code_table

  def initialize(binary, last_byte_bits, code_table)
    @binary = binary
    @last_byte_bits = last_byte_bits
    @code_table = code_table.freeze
  end
end

class << HuffmanCoding
  def encode(input_array, frequencies = HuffmanCoding::Utils.tally(input_array))
    if frequencies.size == 1
      code_table = { frequencies.keys[0] => '0' }
    else
      code_table = {}
      build_tree(frequencies).traverse('', code_table)
    end

    result_binary_string = input_array.map{|char| code_table[char] }.join
    last_byte_bits = result_binary_string.size % 8
    last_byte_bits = 8 if last_byte_bits == 0
    binary = result_binary_string.scan(/.{1,8}/).map{|s| s.to_i(2) }.pack('C*')
    return new(binary, last_byte_bits, code_table)
  end

  def decode(coding)
    text = String.new
    code_table = coding.code_table.invert
    previous = String.new

    add_binary_char = proc do |binary_char|
      previous << binary_char
      if (char = code_table[previous])
        text << char
        previous = String.new
      end
    end

    bytes = coding.binary.bytes.map{|s| s.to_s(2) } # bytes = ['101000', '11', '10101111', ...]
    last_byte = bytes.pop

    bytes.each do |byte|
      (8 - byte.size).times{ add_binary_char['0'] }
      byte.each_char{|s| add_binary_char[s] }
    end

    (coding.last_byte_bits - last_byte.size).times{ add_binary_char['0'] }
    last_byte.each_char{|s| add_binary_char[s] }

    return text
  end

  private

  def build_tree(frequencies)
    level_nodes = LevelNodes.new(frequencies.map{|letter, frequency| Node.new(letter, frequency) })

    while level_nodes.size > 1
      left_level, left_node = level_nodes.pop_min_node
      right_level, right_node = level_nodes.pop_min_node
      next_level = (left_level > right_level ? left_level : right_level) + 1

      new_node = Node.new(nil, left_node.weight + right_node.weight, left_node, right_node)
      level_nodes.push_node(next_level, new_node)
    end

    return new_node
  end
end
